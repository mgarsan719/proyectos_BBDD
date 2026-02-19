package ies.alcores.api_productos.controller;

import ies.alcores.api_productos.model.Producto;
import ies.alcores.api_productos.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/productos")
public class ProductoController {

    @Autowired
    private ProductoService productoService;

    @GetMapping("")
    public ResponseEntity<List<Producto>> findAll(){
        return ResponseEntity.ok(this.productoService.findAll());
    }

    @GetMapping("categoria/{nombreCat}")
    public ResponseEntity<List<Producto>> findByCategoria(@PathVariable String nombreCat){
        return ResponseEntity.ok(this.productoService.findByCategoria(nombreCat));
    }
}
