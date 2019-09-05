Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 050F1AAAA0
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Sep 2019 20:09:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3FE0C36B3F
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Sep 2019 18:09:11 +0000 (UTC)
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
 [209.85.161.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD8D7C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2019 18:09:09 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id 201so1101380ywo.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2019 11:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AdoIReEtFT2VtAHwiGDk+mc4ni7QxZQ0KNcMg6KUUKk=;
 b=ZkWyu3XoZQuqENNkt1QQ82yh0Sq4PEvzxuIGEiDw9FwgyC+BcCB5q63g68X1aTsXE+
 vXo79GkHFbHq9P7wtViSK04o/qxAHCS7qHmfiYXpMuLV4A1wcXv5ATNyfSrKvtHvNvk9
 xY7GqMlY1XOEfMtKEomnsJcEk1i/XcgaHYG1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AdoIReEtFT2VtAHwiGDk+mc4ni7QxZQ0KNcMg6KUUKk=;
 b=kKwoeIPuLxaJwUFB0pHxWmjkRYvc79pR45Ki1NJFvAUErF2oFCn9A7g+9ljOipQ/if
 MqczYi9fnfEVJoeWntw31BaVGBpA4AH4YkVBNATXM8G7vDkdXFYjRQkYs8J89AC9zHD3
 75ezqnX2lchAJKXoeGKoa4FeCIbiAlMasClQY4oXdm24/G+bkZ9Qc9s7/jHWaUoD4PwE
 DE91p3G1KVzPqXQSKLKCYRCxCRxzQyqncDZR4G7jCp7EJIV0Ka426LBauvAzK8bSY45V
 pXt7fwCO8C2MjZNRWf7qIcb8Km/JKNyID0goN2jiDZZqbSU7OKxPUxYQt2sN8vqng38y
 dziA==
X-Gm-Message-State: APjAAAXnSduTPyajyPpU3yVNBTnIL8rkGExYiDCm98pKK2Y+P17TEoZ5
 QyOe7tkXBOeU1QLJoywATLsvdmF0nsufYA==
X-Google-Smtp-Source: APXvYqzCddlCDObB+HIcXeBf1gQsMWh6lTdQIhjdfvLSGX9RJHV0pPZ2SltfPVoAmv6ZMC3+vqqUCA==
X-Received: by 2002:a81:a401:: with SMTP id b1mr3252546ywh.280.1567706948361; 
 Thu, 05 Sep 2019 11:09:08 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-87B6-3043-85D4-3EA1-9FC6.dyn6.twc.com.
 [2606:a000:1401:87b6:3043:85d4:3ea1:9fc6])
 by smtp.gmail.com with ESMTPSA id 82sm563441ywr.52.2019.09.05.11.09.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Sep 2019 11:09:07 -0700 (PDT)
Date: Thu, 5 Sep 2019 14:09:04 -0400
From: Tom Rini <trini@konsulko.com>
To: Lukasz Majewski <lukma@denx.de>
Message-ID: <20190905180904.GA26850@bill-the-cat>
References: <20190904221639.26469-1-lukma@denx.de>
MIME-Version: 1.0
In-Reply-To: <20190904221639.26469-1-lukma@denx.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Feng Li <feng.li_2@nxp.com>, Tien Fong Chee <tien.fong.chee@intel.com>,
 u-boot@lists.denx.de, Sumit Garg <sumit.garg@nxp.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Alison Wang <alison.wang@nxp.com>, Pankit Garg <pankit.garg@nxp.com>,
 Vinitha V Pillai <vinitha.pillai@nxp.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Yinbo Zhu <yinbo.zhu@nxp.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 York Sun <york.sun@nxp.com>, Stefano Babic <sbabic@denx.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 0/3] spi: Split CONFIG_DM_SPI*
 to CONFIG_{SPL_TPL}DM_SPI*
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6808265854467940513=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6808265854467940513==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BE+Tkt66OPlYmEds"
Content-Disposition: inline


--BE+Tkt66OPlYmEds
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 12:16:36AM +0200, Lukasz Majewski wrote:
> This patch series introduces new SPL and TPL specific Kconfig entries for
> DM_SPI* options. Such change allows using the spi driver in SPL/TPL or
> U-Boot proper.
>=20
> First two patches - related to ls10{42}* NXP soc fix some issues with
> defining the DM_SPI* defines in <board>.h file instead of Kconfig.
>=20
> This series doesn't introduce build breaks, but board maintainers are kin=
dly
> asked to check if their boards still boots.
>=20
> Buildman setup for binary size regression checking:
>=20
> ./tools/buildman/buildman.py -b HEAD --count=3D4 ls1043 --output-dir=3D..=
/BUILD/ --force-build -CveE
> ./tools/buildman/buildman.py -b HEAD --count=3D4 ls1043 --output-dir=3D..=
/BUILD/ -Ssdel

So you did fix the ls1043 problems but ls1046 is still a problem.
There's also changes in (add 'B' to the buildman flags above for this
info):
       x86: (for 26/26 boards) spl/u-boot-spl:all -31.6 spl/u-boot-spl:data=
 -11.4 spl/u-boot-spl:rodata -6.3 spl/u-boot-spl:text -13.9
            qemu-x86_64    : spl/u-boot-spl:all -821 spl/u-boot-spl:data -2=
96 spl/u-boot-spl:rodata -164 spl/u-boot-spl:text -361
               spl-u-boot-spl: add: 0/-10, grow: 0/0 bytes: 0/-657 (-657)
                 function                                   old     new   d=
elta
                 spi_flash_post_bind                          3       -    =
  -3
                 dev_get_parent_priv                         11       -    =
 -11
                 spi_post_probe                              35       -    =
 -35
                 spi_child_post_bind                         37       -    =
 -37
                 spi_child_pre_probe                         46       -    =
 -46
                 _u_boot_list_2_driver_2_spi_generic_drv      68       -   =
  -68
                 _u_boot_list_2_uclass_2_spi_nor             76       -    =
 -76
                 _u_boot_list_2_uclass_2_spi_generic         76       -    =
 -76
                 _u_boot_list_2_uclass_2_spi                 76       -    =
 -76
                 spi_slave_ofdata_to_platdata               229       -    =
-229
       arm: (for 688/688 boards) all -19.6 bss -4.5 rodata -2.2 spl/u-boot-=
spl:all -12.2 spl/u-boot-spl:bss -1.1 spl/u-boot-spl:data -1.9 spl/u-boot-s=
pl:rodata -2.0 spl/u-boot-spl:text -7.2 text -12.9
            uniphier_v7    : bss -8 rodata +8
            opos6uldev     : bss -8 rodata +8
            uniphier_ld4_sld8: bss -8 rodata +8
            da850evm       : spl/u-boot-spl:all -614 spl/u-boot-spl:data -1=
44 spl/u-boot-spl:rodata -150 spl/u-boot-spl:text -320
               spl-u-boot-spl: add: 2/-15, grow: 2/0 bytes: 112/-574 (-462)
                 function                                   old     new   d=
elta
                 spi_flash_probe                             38      82    =
 +44
                 spi_setup_slave                              -      42    =
 +42
                 spl_spi_load_image                         124     144    =
 +20
                 spi_free_slave                               -       6    =
  +6
                 spi_flash_std_remove                         4       -    =
  -4
                 spi_flash_post_bind                          4       -    =
  -4
                 spi_flash_cmd_get_sw_write_prot              8       -    =
  -8
                 ____aeabi_uidivmod_from_thumb                8       -    =
  -8
                 spi_flash_std_get_sw_write_prot             18       -    =
 -18
                 spi_flash_read_dm                           20       -    =
 -20
                 __aeabi_uidivmod                            24       -    =
 -24
                 __aeabi_idivmod                             24       -    =
 -24
                 spi_flash_std_write                         42       -    =
 -42
                 spi_flash_std_read                          42       -    =
 -42
                 spi_flash_probe_bus_cs                      56       -    =
 -56
                 _u_boot_list_2_driver_2_spi_flash_std       68       -    =
 -68
                 _u_boot_list_2_uclass_2_spi_nor             76       -    =
 -76
                 spi_flash_std_probe                         88       -    =
 -88
                 spi_flash_std_erase                         92       -    =
 -92
            da850evm_nand  : spl/u-boot-spl:all -614 spl/u-boot-spl:data -1=
44 spl/u-boot-spl:rodata -150 spl/u-boot-spl:text -320
               spl-u-boot-spl: add: 2/-15, grow: 2/0 bytes: 112/-574 (-462)
                 function                                   old     new   d=
elta
                 spi_flash_probe                             38      82    =
 +44
                 spi_setup_slave                              -      42    =
 +42
                 spl_spi_load_image                         124     144    =
 +20
                 spi_free_slave                               -       6    =
  +6
                 spi_flash_std_remove                         4       -    =
  -4
                 spi_flash_post_bind                          4       -    =
  -4
                 spi_flash_cmd_get_sw_write_prot              8       -    =
  -8
                 ____aeabi_uidivmod_from_thumb                8       -    =
  -8
                 spi_flash_std_get_sw_write_prot             18       -    =
 -18
                 spi_flash_read_dm                           20       -    =
 -20
                 __aeabi_uidivmod                            24       -    =
 -24
                 __aeabi_idivmod                             24       -    =
 -24
                 spi_flash_std_write                         42       -    =
 -42
                 spi_flash_std_read                          42       -    =
 -42
                 spi_flash_probe_bus_cs                      56       -    =
 -56
                 _u_boot_list_2_driver_2_spi_flash_std       68       -    =
 -68
                 _u_boot_list_2_uclass_2_spi_nor             76       -    =
 -76
                 spi_flash_std_probe                         88       -    =
 -88
                 spi_flash_std_erase                         92       -    =
 -92
            sama5d3xek_spiflash: spl/u-boot-spl:all -630 spl/u-boot-spl:dat=
a -144 spl/u-boot-spl:rodata -150 spl/u-boot-spl:text -336
               spl-u-boot-spl: add: 2/-12, grow: 2/0 bytes: 196/-676 (-480)
                 function                                   old     new   d=
elta
                 spi_flash_probe                             44     120    =
 +76
                 spi_setup_slave                              -      60    =
 +60
                 spl_spi_load_image                         172     220    =
 +48
                 spi_free_slave                               -      12    =
 +12
                 spi_flash_std_remove                         8       -    =
  -8
                 spi_flash_post_bind                          8       -    =
  -8
                 spi_flash_cmd_get_sw_write_prot             12       -    =
 -12
                 spi_flash_std_get_sw_write_prot             16       -    =
 -16
                 spi_flash_read_dm                           28       -    =
 -28
                 spi_flash_std_write                         64       -    =
 -64
                 spi_flash_std_read                          64       -    =
 -64
                 _u_boot_list_2_driver_2_spi_flash_std       68       -    =
 -68
                 spi_flash_probe_bus_cs                      76       -    =
 -76
                 _u_boot_list_2_uclass_2_spi_nor             76       -    =
 -76
                 spi_flash_std_probe                        116       -    =
-116
                 spi_flash_std_erase                        140       -    =
-140
            socfpga_cyclone5: all -722 bss -136 rodata -98 text -488
               u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           2       -    =
  -2
                 spi_flash_std_remove                        10       4    =
  -6
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_std_probe                         88      76    =
 -12
                 spi_flash_mtd_write                         38       -    =
 -38
                 spi_flash_mtd_read                          38       -    =
 -38
                 spi_flash_mtd_unregister                    52       -    =
 -52
                 spi_flash_mtd_erase                         78       -    =
 -78
                 spi_flash_mtd_register                     172       -    =
-172
                 sf_mtd_info                                240       -    =
-240
            socfpga_socrates: all -794 bss -208 rodata -98 text -488
               u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           2       -    =
  -2
                 spi_flash_std_remove                        10       4    =
  -6
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_std_probe                         88      76    =
 -12
                 spi_flash_mtd_write                         38       -    =
 -38
                 spi_flash_mtd_read                          38       -    =
 -38
                 spi_flash_mtd_unregister                    52       -    =
 -52
                 spi_flash_mtd_erase                         78       -    =
 -78
                 spi_flash_mtd_register                     172       -    =
-172
                 sf_mtd_info                                240       -    =
-240
            socfpga_sockit : all -794 bss -208 rodata -98 text -488
               u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           2       -    =
  -2
                 spi_flash_std_remove                        10       4    =
  -6
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_std_probe                         88      76    =
 -12
                 spi_flash_mtd_write                         38       -    =
 -38
                 spi_flash_mtd_read                          38       -    =
 -38
                 spi_flash_mtd_unregister                    52       -    =
 -52
                 spi_flash_mtd_erase                         78       -    =
 -78
                 spi_flash_mtd_register                     172       -    =
-172
                 sf_mtd_info                                240       -    =
-240
            socfpga_arria5 : all -794 bss -208 rodata -98 text -488
               u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           2       -    =
  -2
                 spi_flash_std_remove                        10       4    =
  -6
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_std_probe                         88      76    =
 -12
                 spi_flash_mtd_write                         38       -    =
 -38
                 spi_flash_mtd_read                          38       -    =
 -38
                 spi_flash_mtd_unregister                    52       -    =
 -52
                 spi_flash_mtd_erase                         78       -    =
 -78
                 spi_flash_mtd_register                     172       -    =
-172
                 sf_mtd_info                                240       -    =
-240
            socfpga_is1    : all -794 bss -208 rodata -98 text -488
               u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           2       -    =
  -2
                 spi_flash_std_remove                        10       4    =
  -6
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_std_probe                         88      76    =
 -12
                 spi_flash_mtd_write                         38       -    =
 -38
                 spi_flash_mtd_read                          38       -    =
 -38
                 spi_flash_mtd_unregister                    52       -    =
 -52
                 spi_flash_mtd_erase                         78       -    =
 -78
                 spi_flash_mtd_register                     172       -    =
-172
                 sf_mtd_info                                240       -    =
-240
            socfpga_vining_fpga: all -858 bss -272 rodata -98 text -488
               u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           2       -    =
  -2
                 spi_flash_std_remove                        10       4    =
  -6
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_std_probe                         88      76    =
 -12
                 spi_flash_mtd_write                         38       -    =
 -38
                 spi_flash_mtd_read                          38       -    =
 -38
                 spi_flash_mtd_unregister                    52       -    =
 -52
                 spi_flash_mtd_erase                         78       -    =
 -78
                 spi_flash_mtd_register                     172       -    =
-172
                 sf_mtd_info                                240       -    =
-240
            socfpga_sr1500 : all -858 bss -280 rodata -98 text -480
               u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           2       -    =
  -2
                 spi_flash_std_remove                        10       4    =
  -6
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_std_probe                         88      76    =
 -12
                 spi_flash_mtd_write                         38       -    =
 -38
                 spi_flash_mtd_read                          38       -    =
 -38
                 spi_flash_mtd_unregister                    52       -    =
 -52
                 spi_flash_mtd_erase                         78       -    =
 -78
                 spi_flash_mtd_register                     172       -    =
-172
                 sf_mtd_info                                240       -    =
-240
            cm_fx6         : all -1130 bss -296 rodata -146 text -688
               u-boot: add: 0/-11, grow: 0/-2 bytes: 0/-829 (-829)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           2       -    =
  -2
                 spi_flash_free                              26      22    =
  -4
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_probe                             88      78    =
 -10
                 idr_remove                                  20       -    =
 -20
                 spi_flash_mtd_write                         44       -    =
 -44
                 spi_flash_mtd_read                          44       -    =
 -44
                 spi_flash_mtd_unregister                    52       -    =
 -52
                 del_mtd_device                              68       -    =
 -68
                 spi_flash_mtd_erase                        164       -    =
-164
                 spi_flash_mtd_register                     172       -    =
-172
                 sf_mtd_info                                240       -    =
-240
            aristainetos   : all -1186 bss -264 rodata -98 text -824
               u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-981 (-981)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           4       -    =
  -4
                 spi_flash_free                              32      28    =
  -4
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_probe                            136     120    =
 -16
                 spi_flash_mtd_write                         80       -    =
 -80
                 spi_flash_mtd_read                          80       -    =
 -80
                 spi_flash_mtd_unregister                    84       -    =
 -84
                 spi_flash_mtd_erase                        220       -    =
-220
                 sf_mtd_info                                240       -    =
-240
                 spi_flash_mtd_register                     244       -    =
-244
            aristainetos2  : all -1186 bss -264 rodata -98 text -824
               u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-981 (-981)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           4       -    =
  -4
                 spi_flash_free                              32      28    =
  -4
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_probe                            136     120    =
 -16
                 spi_flash_mtd_write                         80       -    =
 -80
                 spi_flash_mtd_read                          80       -    =
 -80
                 spi_flash_mtd_unregister                    84       -    =
 -84
                 spi_flash_mtd_erase                        220       -    =
-220
                 sf_mtd_info                                240       -    =
-240
                 spi_flash_mtd_register                     244       -    =
-244
            aristainetos2b : all -1186 bss -264 rodata -98 text -824
               u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-981 (-981)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           4       -    =
  -4
                 spi_flash_free                              32      28    =
  -4
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_probe                            136     120    =
 -16
                 spi_flash_mtd_write                         80       -    =
 -80
                 spi_flash_mtd_read                          80       -    =
 -80
                 spi_flash_mtd_unregister                    84       -    =
 -84
                 spi_flash_mtd_erase                        220       -    =
-220
                 sf_mtd_info                                240       -    =
-240
                 spi_flash_mtd_register                     244       -    =
-244
            display5_factory: all -1561 bss -216 rodata -201 text -1144
               u-boot: add: 0/-13, grow: 0/-2 bytes: 0/-1237 (-1237)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           2       -    =
  -2
                 spi_flash_free                              26      22    =
  -4
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_probe                             88      78    =
 -10
                 idr_remove                                  20       -    =
 -20
                 spi_flash_mtd_write                         44       -    =
 -44
                 spi_flash_mtd_read                          44       -    =
 -44
                 spi_flash_mtd_unregister                    52       -    =
 -52
                 del_mtd_device                              68       -    =
 -68
                 mtd_unlock                                  80       -    =
 -80
                 spi_flash_mtd_erase                        164       -    =
-164
                 spi_flash_mtd_register                     172       -    =
-172
                 sf_mtd_info                                240       -    =
-240
                 add_mtd_device                             328       -    =
-328
            display5       : all -1605 bss -248 rodata -201 text -1156
               u-boot: add: 0/-13, grow: 0/-2 bytes: 0/-1237 (-1237)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           2       -    =
  -2
                 spi_flash_free                              26      22    =
  -4
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_probe                             88      78    =
 -10
                 idr_remove                                  20       -    =
 -20
                 spi_flash_mtd_write                         44       -    =
 -44
                 spi_flash_mtd_read                          44       -    =
 -44
                 spi_flash_mtd_unregister                    52       -    =
 -52
                 del_mtd_device                              68       -    =
 -68
                 mtd_unlock                                  80       -    =
 -80
                 spi_flash_mtd_erase                        164       -    =
-164
                 spi_flash_mtd_register                     172       -    =
-172
                 sf_mtd_info                                240       -    =
-240
                 add_mtd_device                             328       -    =
-328
            brppt1_spi     : spl/u-boot-spl:all -2109 spl/u-boot-spl:bss -4=
 spl/u-boot-spl:data -436 spl/u-boot-spl:rodata -309 spl/u-boot-spl:text -1=
360
               spl-u-boot-spl: add: 3/-41, grow: 5/-2 bytes: 1310/-3100 (-1=
790)
                 function                                   old     new   d=
elta
                 spi_xfer                                     6     800    =
+794
                 spi_claim_bus                                6     248    =
+242
                 spi_setup_slave                              -     156    =
+156
                 spi_do_alloc_slave                           -      48    =
 +48
                 spi_flash_probe                             26      72    =
 +46
                 spl_spi_load_image                         124     140    =
 +16
                 spi_release_bus                              6      12    =
  +6
                 spi_free_slave                               -       2    =
  +2
                 spi_flash_std_remove                         4       -    =
  -4
                 spi_flash_post_bind                          4       -    =
  -4
                 omap4_pdata                                  4       -    =
  -4
                 omap2_pdata                                  4       -    =
  -4
                 dev_get_parent_priv                          6       -    =
  -6
                 spi_flash_cmd_get_sw_write_prot              8       -    =
  -8
                 spi_flash_std_get_sw_write_prot             14       -    =
 -14
                 spi_flash_read_dm                           14       -    =
 -14
                 dm_spi_release_bus                          14       -    =
 -14
                 ofnode_read_bool                            16       -    =
 -16
                 fdtdec_get_bool                             20       -    =
 -20
                 omap3_spi_release_bus                       22       -    =
 -22
                 spi_mem_adjust_op_size                      92      68    =
 -24
                 spi_child_post_bind                         30       -    =
 -30
                 spi_post_probe                              32       -    =
 -32
                 spi_flash_std_write                         34       -    =
 -34
                 spi_flash_std_read                          34       -    =
 -34
                 spi_child_pre_probe                         34       -    =
 -34
                 dm_spi_xfer                                 34       -    =
 -34
                 spi_mem_supports_op                         36       -    =
 -36
                 spi_flash_probe_bus_cs                      48       -    =
 -48
                 spi_find_chip_select                        50       -    =
 -50
                 omap3_spi_claim_bus                         54       -    =
 -54
                 static.spi_check_buswidth_req               56       -    =
 -56
                 omap3_spi_set_wordlen                       62       -    =
 -62
                 spi_mem_exec_op                            284     220    =
 -64
                 _u_boot_list_2_driver_2_spi_generic_drv      68       -   =
  -68
                 _u_boot_list_2_driver_2_spi_flash_std       68       -    =
 -68
                 _u_boot_list_2_driver_2_omap3_spi           68       -    =
 -68
                 spi_set_speed_mode                          72       -    =
 -72
                 spi_flash_std_probe                         76       -    =
 -76
                 omap3_spi_set_speed                         76       -    =
 -76
                 _u_boot_list_2_uclass_2_spi_nor             76       -    =
 -76
                 _u_boot_list_2_uclass_2_spi_generic         76       -    =
 -76
                 _u_boot_list_2_uclass_2_spi                 76       -    =
 -76
                 spi_flash_std_erase                         84       -    =
 -84
                 spi_mem_default_supports_op                 86       -    =
 -86
                 omap3_spi_set_mode                          96       -    =
 -96
                 dm_spi_claim_bus                           100       -    =
-100
                 omap3_spi_probe                            116       -    =
-116
                 spi_slave_ofdata_to_platdata               212       -    =
-212
                 spi_get_bus_and_cs                         232       -    =
-232
                 omap3_spi_xfer                             796       -    =
-796
            brsmarc1       : spl/u-boot-spl:all -2113 spl/u-boot-spl:bss -4=
 spl/u-boot-spl:data -436 spl/u-boot-spl:rodata -309 spl/u-boot-spl:text -1=
364
               spl-u-boot-spl: add: 3/-41, grow: 5/-2 bytes: 1310/-3100 (-1=
790)
                 function                                   old     new   d=
elta
                 spi_xfer                                     6     800    =
+794
                 spi_claim_bus                                6     248    =
+242
                 spi_setup_slave                              -     156    =
+156
                 spi_do_alloc_slave                           -      48    =
 +48
                 spi_flash_probe                             26      72    =
 +46
                 spl_spi_load_image                         124     140    =
 +16
                 spi_release_bus                              6      12    =
  +6
                 spi_free_slave                               -       2    =
  +2
                 spi_flash_std_remove                         4       -    =
  -4
                 spi_flash_post_bind                          4       -    =
  -4
                 omap4_pdata                                  4       -    =
  -4
                 omap2_pdata                                  4       -    =
  -4
                 dev_get_parent_priv                          6       -    =
  -6
                 spi_flash_cmd_get_sw_write_prot              8       -    =
  -8
                 spi_flash_std_get_sw_write_prot             14       -    =
 -14
                 spi_flash_read_dm                           14       -    =
 -14
                 dm_spi_release_bus                          14       -    =
 -14
                 ofnode_read_bool                            16       -    =
 -16
                 fdtdec_get_bool                             20       -    =
 -20
                 omap3_spi_release_bus                       22       -    =
 -22
                 spi_mem_adjust_op_size                      92      68    =
 -24
                 spi_child_post_bind                         30       -    =
 -30
                 spi_post_probe                              32       -    =
 -32
                 spi_flash_std_write                         34       -    =
 -34
                 spi_flash_std_read                          34       -    =
 -34
                 spi_child_pre_probe                         34       -    =
 -34
                 dm_spi_xfer                                 34       -    =
 -34
                 spi_mem_supports_op                         36       -    =
 -36
                 spi_flash_probe_bus_cs                      48       -    =
 -48
                 spi_find_chip_select                        50       -    =
 -50
                 omap3_spi_claim_bus                         54       -    =
 -54
                 static.spi_check_buswidth_req               56       -    =
 -56
                 omap3_spi_set_wordlen                       62       -    =
 -62
                 spi_mem_exec_op                            284     220    =
 -64
                 _u_boot_list_2_driver_2_spi_generic_drv      68       -   =
  -68
                 _u_boot_list_2_driver_2_spi_flash_std       68       -    =
 -68
                 _u_boot_list_2_driver_2_omap3_spi           68       -    =
 -68
                 spi_set_speed_mode                          72       -    =
 -72
                 spi_flash_std_probe                         76       -    =
 -76
                 omap3_spi_set_speed                         76       -    =
 -76
                 _u_boot_list_2_uclass_2_spi_nor             76       -    =
 -76
                 _u_boot_list_2_uclass_2_spi_generic         76       -    =
 -76
                 _u_boot_list_2_uclass_2_spi                 76       -    =
 -76
                 spi_flash_std_erase                         84       -    =
 -84
                 spi_mem_default_supports_op                 86       -    =
 -86
                 omap3_spi_set_mode                          96       -    =
 -96
                 dm_spi_claim_bus                           100       -    =
-100
                 omap3_spi_probe                            116       -    =
-116
                 spi_slave_ofdata_to_platdata               212       -    =
-212
                 spi_get_bus_and_cs                         232       -    =
-232
                 omap3_spi_xfer                             796       -    =
-796
            stm32mp15_basic: spl/u-boot-spl:all -2312 spl/u-boot-spl:bss -7=
72 spl/u-boot-spl:rodata -292 spl/u-boot-spl:text -1248
               spl-u-boot-spl: add: 0/-19, grow: 0/-2 bytes: 0/-2013 (-2013)
                 function                                   old     new   d=
elta
                 sf_mtd_registered                            1       -    =
  -1
                 spi_flash_mtd_sync                           2       -    =
  -2
                 spi_flash_std_remove                        10       4    =
  -6
                 spi_flash_erase_dm                           8       -    =
  -8
                 sf_mtd_name                                  8       -    =
  -8
                 spi_flash_std_probe                         88      76    =
 -12
                 spi_flash_write_dm                          14       -    =
 -14
                 idr_remove                                  20       -    =
 -20
                 spi_flash_mtd_write                         38       -    =
 -38
                 spi_flash_mtd_read                          38       -    =
 -38
                 spi_flash_mtd_unregister                    52       -    =
 -52
                 spi_flash_mtd_erase                         78       -    =
 -78
                 mtd_unlock                                  80       -    =
 -80
                 del_mtd_device                              80       -    =
 -80
                 mtd_erase_callback                          88       -    =
 -88
                 part_erase                                  96       -    =
 -96
                 del_mtd_partitions                         136       -    =
-136
                 spi_flash_mtd_register                     172       -    =
-172
                 sf_mtd_info                                240       -    =
-240
                 add_mtd_device                             328       -    =
-328
                 mtd_idr                                    516       -    =
-516

--=20
Tom

--BE+Tkt66OPlYmEds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdcU9AAAoJEIf59jXTHXZSMmwQAKzgUZYOd8Trs1UEYRsI3MBc
BpSWJ7jmm+k3wf37iFbp6rqM9TTpIpErwHBXj9uZkt6PhjMHWAcuohdXkifJqsoz
khgpRL5aMWHdhobd+7kEwyyc89sT/UV14hFi5wH016Ilqa87KWdnrYOjjqR2dFnP
EPggGRT1tWQnzpL3KHfkL8N8fPlXifoTGLnm8PBA6QWNmhMSms5PepO1PmmPRUP/
AKayXpOtVQMPcrYgOCbJcwRI9aOHLe3hsN4qdCpUhNAonDyx8tBH7zPiA07e9dKL
HuIU9XyR2ITK7Igx4LJgiuX6j5Fs9TXOASAonmN6SSPFDBLLkCREtOQqVrCjBB3g
Sc4wgRYAdIDTeS/jtaSJXnIbOogg+VOAsWXE2bp2Gj9Q1+XuAVwVGI4/eWcs5008
3pN9jtHwEzViDsQ4fm2PM3lZjqNjyXuKgjcdFFe4oDdOMezJr2QSsN7ZbuZnHMiy
VP4tuq+Pb8BsyPFfxJIsh/wvzGc6g1yO1VoWbo+x6G3hGBlEyssZ/bnLm9z/5eIV
gDNXBuN+imwB2aQ0eW2fsAByQ4kTBDpzu5UzsWK8XyKWo8riGDWRQfq9YCJ2ArKm
aFQqpnbTaDoQ053h7a1IZb/PlURkngWO0X2D9nis/qPqiViXvis9nFFoFRe5EquD
OkoiPjEQLJoSVvl5xmgc
=17Qk
-----END PGP SIGNATURE-----

--BE+Tkt66OPlYmEds--

--===============6808265854467940513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6808265854467940513==--
