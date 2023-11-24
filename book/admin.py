from django.contrib import admin

from book.models import Autor, Libro


# Register your models here.
@admin.register(Autor)
class PositionAdmin(admin.ModelAdmin):
    list_display = ['nombre', 'fecha_nacimiento']
    list_filter = ['fecha_nacimiento']
    search_fields = ['nombre']
    ordering = ['nombre']


@admin.register(Libro)
class PositionAdmin(admin.ModelAdmin):
    list_display = ['titulo', 'autor', 'fecha_publicacion']
    list_filter = ['fecha_publicacion']
    search_fields = ['titulo']
    ordering = ['titulo']
