Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB43AD7D7
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Sep 2019 13:26:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A4A5C36B3F
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Sep 2019 11:26:08 +0000 (UTC)
Received: from skedge04.snt-world.com (skedge04.snt-world.com [91.208.41.69])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F6BDC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Sep 2019 11:11:53 +0000 (UTC)
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id C063F67A8D1;
 Mon,  9 Sep 2019 13:11:51 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 9 Sep 2019
 13:11:51 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Mon, 9 Sep 2019 13:11:51 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Lukasz Majewski <lukma@denx.de>
Thread-Topic: [U-Boot] [PATCH v3 0/3] spi: Split CONFIG_DM_SPI* to
 CONFIG_{SPL_TPL}DM_SPI*
Thread-Index: AQHVZBUYRxTl92hEQkyjZMEzXHVzD6cjFQ8A
Date: Mon, 9 Sep 2019 11:11:50 +0000
Message-ID: <e5d7e314-3cf9-687a-d638-19ebaef6279b@kontron.de>
References: <20190904221639.26469-1-lukma@denx.de>
 <20190905180904.GA26850@bill-the-cat>
In-Reply-To: <20190905180904.GA26850@bill-the-cat>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <78DE147EACC5C9469B3FC7E34FBAC9F5@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: C063F67A8D1.A0F88
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: alison.wang@nxp.com, feng.li_2@nxp.com,
 joe.hershberger@ni.com, lukma@denx.de, pankit.garg@nxp.com,
 sr@denx.de, sumit.garg@nxp.com, tien.fong.chee@intel.com,
 trini@konsulko.com, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, vinitha.pillai@nxp.com,
 xypron.glpk@gmx.de, yinbo.zhu@nxp.com, york.sun@nxp.com
X-Spam-Status: No
X-Mailman-Approved-At: Mon, 09 Sep 2019 11:26:07 +0000
Cc: Feng Li <feng.li_2@nxp.com>, Tom Rini <trini@konsulko.com>,
 Tien Fong Chee <tien.fong.chee@intel.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Sumit Garg <sumit.garg@nxp.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Alison Wang <alison.wang@nxp.com>,
 Pankit Garg <pankit.garg@nxp.com>, Vinitha V Pillai <vinitha.pillai@nxp.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Yinbo Zhu <yinbo.zhu@nxp.com>,
 Stefan Roese <sr@denx.de>, York Sun <york.sun@nxp.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Lukasz,

On 05.09.19 20:09, Tom Rini wrote:
> On Thu, Sep 05, 2019 at 12:16:36AM +0200, Lukasz Majewski wrote:
>> This patch series introduces new SPL and TPL specific Kconfig entries for
>> DM_SPI* options. Such change allows using the spi driver in SPL/TPL or
>> U-Boot proper.
>>
>> First two patches - related to ls10{42}* NXP soc fix some issues with
>> defining the DM_SPI* defines in <board>.h file instead of Kconfig.
>>
>> This series doesn't introduce build breaks, but board maintainers are kindly
>> asked to check if their boards still boots.
>>
>> Buildman setup for binary size regression checking:
>>
>> ./tools/buildman/buildman.py -b HEAD --count=4 ls1043 --output-dir=../BUILD/ --force-build -CveE
>> ./tools/buildman/buildman.py -b HEAD --count=4 ls1043 --output-dir=../BUILD/ -Ssdel
> 
> So you did fix the ls1043 problems but ls1046 is still a problem.

I was trying to clean up this config mess some weeks ago. I stumbled 
over the same issues (size deltas below) when I tested with buildman and 
finally gave up on it. This was my testing branch for reference: [1].

Thanks for your work and I hope you/we can get this sorted out somehow...

Regards,
Frieder

[1]: https://github.com/fschrempf/u-boot/commits/non_dm_spi_flash_in_spl

> There's also changes in (add 'B' to the buildman flags above for this
> info):
>         x86: (for 26/26 boards) spl/u-boot-spl:all -31.6 spl/u-boot-spl:data -11.4 spl/u-boot-spl:rodata -6.3 spl/u-boot-spl:text -13.9
>              qemu-x86_64    : spl/u-boot-spl:all -821 spl/u-boot-spl:data -296 spl/u-boot-spl:rodata -164 spl/u-boot-spl:text -361
>                 spl-u-boot-spl: add: 0/-10, grow: 0/0 bytes: 0/-657 (-657)
>                   function                                   old     new   delta
>                   spi_flash_post_bind                          3       -      -3
>                   dev_get_parent_priv                         11       -     -11
>                   spi_post_probe                              35       -     -35
>                   spi_child_post_bind                         37       -     -37
>                   spi_child_pre_probe                         46       -     -46
>                   _u_boot_list_2_driver_2_spi_generic_drv      68       -     -68
>                   _u_boot_list_2_uclass_2_spi_nor             76       -     -76
>                   _u_boot_list_2_uclass_2_spi_generic         76       -     -76
>                   _u_boot_list_2_uclass_2_spi                 76       -     -76
>                   spi_slave_ofdata_to_platdata               229       -    -229
>         arm: (for 688/688 boards) all -19.6 bss -4.5 rodata -2.2 spl/u-boot-spl:all -12.2 spl/u-boot-spl:bss -1.1 spl/u-boot-spl:data -1.9 spl/u-boot-spl:rodata -2.0 spl/u-boot-spl:text -7.2 text -12.9
>              uniphier_v7    : bss -8 rodata +8
>              opos6uldev     : bss -8 rodata +8
>              uniphier_ld4_sld8: bss -8 rodata +8
>              da850evm       : spl/u-boot-spl:all -614 spl/u-boot-spl:data -144 spl/u-boot-spl:rodata -150 spl/u-boot-spl:text -320
>                 spl-u-boot-spl: add: 2/-15, grow: 2/0 bytes: 112/-574 (-462)
>                   function                                   old     new   delta
>                   spi_flash_probe                             38      82     +44
>                   spi_setup_slave                              -      42     +42
>                   spl_spi_load_image                         124     144     +20
>                   spi_free_slave                               -       6      +6
>                   spi_flash_std_remove                         4       -      -4
>                   spi_flash_post_bind                          4       -      -4
>                   spi_flash_cmd_get_sw_write_prot              8       -      -8
>                   ____aeabi_uidivmod_from_thumb                8       -      -8
>                   spi_flash_std_get_sw_write_prot             18       -     -18
>                   spi_flash_read_dm                           20       -     -20
>                   __aeabi_uidivmod                            24       -     -24
>                   __aeabi_idivmod                             24       -     -24
>                   spi_flash_std_write                         42       -     -42
>                   spi_flash_std_read                          42       -     -42
>                   spi_flash_probe_bus_cs                      56       -     -56
>                   _u_boot_list_2_driver_2_spi_flash_std       68       -     -68
>                   _u_boot_list_2_uclass_2_spi_nor             76       -     -76
>                   spi_flash_std_probe                         88       -     -88
>                   spi_flash_std_erase                         92       -     -92
>              da850evm_nand  : spl/u-boot-spl:all -614 spl/u-boot-spl:data -144 spl/u-boot-spl:rodata -150 spl/u-boot-spl:text -320
>                 spl-u-boot-spl: add: 2/-15, grow: 2/0 bytes: 112/-574 (-462)
>                   function                                   old     new   delta
>                   spi_flash_probe                             38      82     +44
>                   spi_setup_slave                              -      42     +42
>                   spl_spi_load_image                         124     144     +20
>                   spi_free_slave                               -       6      +6
>                   spi_flash_std_remove                         4       -      -4
>                   spi_flash_post_bind                          4       -      -4
>                   spi_flash_cmd_get_sw_write_prot              8       -      -8
>                   ____aeabi_uidivmod_from_thumb                8       -      -8
>                   spi_flash_std_get_sw_write_prot             18       -     -18
>                   spi_flash_read_dm                           20       -     -20
>                   __aeabi_uidivmod                            24       -     -24
>                   __aeabi_idivmod                             24       -     -24
>                   spi_flash_std_write                         42       -     -42
>                   spi_flash_std_read                          42       -     -42
>                   spi_flash_probe_bus_cs                      56       -     -56
>                   _u_boot_list_2_driver_2_spi_flash_std       68       -     -68
>                   _u_boot_list_2_uclass_2_spi_nor             76       -     -76
>                   spi_flash_std_probe                         88       -     -88
>                   spi_flash_std_erase                         92       -     -92
>              sama5d3xek_spiflash: spl/u-boot-spl:all -630 spl/u-boot-spl:data -144 spl/u-boot-spl:rodata -150 spl/u-boot-spl:text -336
>                 spl-u-boot-spl: add: 2/-12, grow: 2/0 bytes: 196/-676 (-480)
>                   function                                   old     new   delta
>                   spi_flash_probe                             44     120     +76
>                   spi_setup_slave                              -      60     +60
>                   spl_spi_load_image                         172     220     +48
>                   spi_free_slave                               -      12     +12
>                   spi_flash_std_remove                         8       -      -8
>                   spi_flash_post_bind                          8       -      -8
>                   spi_flash_cmd_get_sw_write_prot             12       -     -12
>                   spi_flash_std_get_sw_write_prot             16       -     -16
>                   spi_flash_read_dm                           28       -     -28
>                   spi_flash_std_write                         64       -     -64
>                   spi_flash_std_read                          64       -     -64
>                   _u_boot_list_2_driver_2_spi_flash_std       68       -     -68
>                   spi_flash_probe_bus_cs                      76       -     -76
>                   _u_boot_list_2_uclass_2_spi_nor             76       -     -76
>                   spi_flash_std_probe                        116       -    -116
>                   spi_flash_std_erase                        140       -    -140
>              socfpga_cyclone5: all -722 bss -136 rodata -98 text -488
>                 u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           2       -      -2
>                   spi_flash_std_remove                        10       4      -6
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_std_probe                         88      76     -12
>                   spi_flash_mtd_write                         38       -     -38
>                   spi_flash_mtd_read                          38       -     -38
>                   spi_flash_mtd_unregister                    52       -     -52
>                   spi_flash_mtd_erase                         78       -     -78
>                   spi_flash_mtd_register                     172       -    -172
>                   sf_mtd_info                                240       -    -240
>              socfpga_socrates: all -794 bss -208 rodata -98 text -488
>                 u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           2       -      -2
>                   spi_flash_std_remove                        10       4      -6
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_std_probe                         88      76     -12
>                   spi_flash_mtd_write                         38       -     -38
>                   spi_flash_mtd_read                          38       -     -38
>                   spi_flash_mtd_unregister                    52       -     -52
>                   spi_flash_mtd_erase                         78       -     -78
>                   spi_flash_mtd_register                     172       -    -172
>                   sf_mtd_info                                240       -    -240
>              socfpga_sockit : all -794 bss -208 rodata -98 text -488
>                 u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           2       -      -2
>                   spi_flash_std_remove                        10       4      -6
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_std_probe                         88      76     -12
>                   spi_flash_mtd_write                         38       -     -38
>                   spi_flash_mtd_read                          38       -     -38
>                   spi_flash_mtd_unregister                    52       -     -52
>                   spi_flash_mtd_erase                         78       -     -78
>                   spi_flash_mtd_register                     172       -    -172
>                   sf_mtd_info                                240       -    -240
>              socfpga_arria5 : all -794 bss -208 rodata -98 text -488
>                 u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           2       -      -2
>                   spi_flash_std_remove                        10       4      -6
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_std_probe                         88      76     -12
>                   spi_flash_mtd_write                         38       -     -38
>                   spi_flash_mtd_read                          38       -     -38
>                   spi_flash_mtd_unregister                    52       -     -52
>                   spi_flash_mtd_erase                         78       -     -78
>                   spi_flash_mtd_register                     172       -    -172
>                   sf_mtd_info                                240       -    -240
>              socfpga_is1    : all -794 bss -208 rodata -98 text -488
>                 u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           2       -      -2
>                   spi_flash_std_remove                        10       4      -6
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_std_probe                         88      76     -12
>                   spi_flash_mtd_write                         38       -     -38
>                   spi_flash_mtd_read                          38       -     -38
>                   spi_flash_mtd_unregister                    52       -     -52
>                   spi_flash_mtd_erase                         78       -     -78
>                   spi_flash_mtd_register                     172       -    -172
>                   sf_mtd_info                                240       -    -240
>              socfpga_vining_fpga: all -858 bss -272 rodata -98 text -488
>                 u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           2       -      -2
>                   spi_flash_std_remove                        10       4      -6
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_std_probe                         88      76     -12
>                   spi_flash_mtd_write                         38       -     -38
>                   spi_flash_mtd_read                          38       -     -38
>                   spi_flash_mtd_unregister                    52       -     -52
>                   spi_flash_mtd_erase                         78       -     -78
>                   spi_flash_mtd_register                     172       -    -172
>                   sf_mtd_info                                240       -    -240
>              socfpga_sr1500 : all -858 bss -280 rodata -98 text -480
>                 u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-647 (-647)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           2       -      -2
>                   spi_flash_std_remove                        10       4      -6
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_std_probe                         88      76     -12
>                   spi_flash_mtd_write                         38       -     -38
>                   spi_flash_mtd_read                          38       -     -38
>                   spi_flash_mtd_unregister                    52       -     -52
>                   spi_flash_mtd_erase                         78       -     -78
>                   spi_flash_mtd_register                     172       -    -172
>                   sf_mtd_info                                240       -    -240
>              cm_fx6         : all -1130 bss -296 rodata -146 text -688
>                 u-boot: add: 0/-11, grow: 0/-2 bytes: 0/-829 (-829)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           2       -      -2
>                   spi_flash_free                              26      22      -4
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_probe                             88      78     -10
>                   idr_remove                                  20       -     -20
>                   spi_flash_mtd_write                         44       -     -44
>                   spi_flash_mtd_read                          44       -     -44
>                   spi_flash_mtd_unregister                    52       -     -52
>                   del_mtd_device                              68       -     -68
>                   spi_flash_mtd_erase                        164       -    -164
>                   spi_flash_mtd_register                     172       -    -172
>                   sf_mtd_info                                240       -    -240
>              aristainetos   : all -1186 bss -264 rodata -98 text -824
>                 u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-981 (-981)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           4       -      -4
>                   spi_flash_free                              32      28      -4
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_probe                            136     120     -16
>                   spi_flash_mtd_write                         80       -     -80
>                   spi_flash_mtd_read                          80       -     -80
>                   spi_flash_mtd_unregister                    84       -     -84
>                   spi_flash_mtd_erase                        220       -    -220
>                   sf_mtd_info                                240       -    -240
>                   spi_flash_mtd_register                     244       -    -244
>              aristainetos2  : all -1186 bss -264 rodata -98 text -824
>                 u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-981 (-981)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           4       -      -4
>                   spi_flash_free                              32      28      -4
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_probe                            136     120     -16
>                   spi_flash_mtd_write                         80       -     -80
>                   spi_flash_mtd_read                          80       -     -80
>                   spi_flash_mtd_unregister                    84       -     -84
>                   spi_flash_mtd_erase                        220       -    -220
>                   sf_mtd_info                                240       -    -240
>                   spi_flash_mtd_register                     244       -    -244
>              aristainetos2b : all -1186 bss -264 rodata -98 text -824
>                 u-boot: add: 0/-9, grow: 0/-2 bytes: 0/-981 (-981)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           4       -      -4
>                   spi_flash_free                              32      28      -4
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_probe                            136     120     -16
>                   spi_flash_mtd_write                         80       -     -80
>                   spi_flash_mtd_read                          80       -     -80
>                   spi_flash_mtd_unregister                    84       -     -84
>                   spi_flash_mtd_erase                        220       -    -220
>                   sf_mtd_info                                240       -    -240
>                   spi_flash_mtd_register                     244       -    -244
>              display5_factory: all -1561 bss -216 rodata -201 text -1144
>                 u-boot: add: 0/-13, grow: 0/-2 bytes: 0/-1237 (-1237)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           2       -      -2
>                   spi_flash_free                              26      22      -4
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_probe                             88      78     -10
>                   idr_remove                                  20       -     -20
>                   spi_flash_mtd_write                         44       -     -44
>                   spi_flash_mtd_read                          44       -     -44
>                   spi_flash_mtd_unregister                    52       -     -52
>                   del_mtd_device                              68       -     -68
>                   mtd_unlock                                  80       -     -80
>                   spi_flash_mtd_erase                        164       -    -164
>                   spi_flash_mtd_register                     172       -    -172
>                   sf_mtd_info                                240       -    -240
>                   add_mtd_device                             328       -    -328
>              display5       : all -1605 bss -248 rodata -201 text -1156
>                 u-boot: add: 0/-13, grow: 0/-2 bytes: 0/-1237 (-1237)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           2       -      -2
>                   spi_flash_free                              26      22      -4
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_probe                             88      78     -10
>                   idr_remove                                  20       -     -20
>                   spi_flash_mtd_write                         44       -     -44
>                   spi_flash_mtd_read                          44       -     -44
>                   spi_flash_mtd_unregister                    52       -     -52
>                   del_mtd_device                              68       -     -68
>                   mtd_unlock                                  80       -     -80
>                   spi_flash_mtd_erase                        164       -    -164
>                   spi_flash_mtd_register                     172       -    -172
>                   sf_mtd_info                                240       -    -240
>                   add_mtd_device                             328       -    -328
>              brppt1_spi     : spl/u-boot-spl:all -2109 spl/u-boot-spl:bss -4 spl/u-boot-spl:data -436 spl/u-boot-spl:rodata -309 spl/u-boot-spl:text -1360
>                 spl-u-boot-spl: add: 3/-41, grow: 5/-2 bytes: 1310/-3100 (-1790)
>                   function                                   old     new   delta
>                   spi_xfer                                     6     800    +794
>                   spi_claim_bus                                6     248    +242
>                   spi_setup_slave                              -     156    +156
>                   spi_do_alloc_slave                           -      48     +48
>                   spi_flash_probe                             26      72     +46
>                   spl_spi_load_image                         124     140     +16
>                   spi_release_bus                              6      12      +6
>                   spi_free_slave                               -       2      +2
>                   spi_flash_std_remove                         4       -      -4
>                   spi_flash_post_bind                          4       -      -4
>                   omap4_pdata                                  4       -      -4
>                   omap2_pdata                                  4       -      -4
>                   dev_get_parent_priv                          6       -      -6
>                   spi_flash_cmd_get_sw_write_prot              8       -      -8
>                   spi_flash_std_get_sw_write_prot             14       -     -14
>                   spi_flash_read_dm                           14       -     -14
>                   dm_spi_release_bus                          14       -     -14
>                   ofnode_read_bool                            16       -     -16
>                   fdtdec_get_bool                             20       -     -20
>                   omap3_spi_release_bus                       22       -     -22
>                   spi_mem_adjust_op_size                      92      68     -24
>                   spi_child_post_bind                         30       -     -30
>                   spi_post_probe                              32       -     -32
>                   spi_flash_std_write                         34       -     -34
>                   spi_flash_std_read                          34       -     -34
>                   spi_child_pre_probe                         34       -     -34
>                   dm_spi_xfer                                 34       -     -34
>                   spi_mem_supports_op                         36       -     -36
>                   spi_flash_probe_bus_cs                      48       -     -48
>                   spi_find_chip_select                        50       -     -50
>                   omap3_spi_claim_bus                         54       -     -54
>                   static.spi_check_buswidth_req               56       -     -56
>                   omap3_spi_set_wordlen                       62       -     -62
>                   spi_mem_exec_op                            284     220     -64
>                   _u_boot_list_2_driver_2_spi_generic_drv      68       -     -68
>                   _u_boot_list_2_driver_2_spi_flash_std       68       -     -68
>                   _u_boot_list_2_driver_2_omap3_spi           68       -     -68
>                   spi_set_speed_mode                          72       -     -72
>                   spi_flash_std_probe                         76       -     -76
>                   omap3_spi_set_speed                         76       -     -76
>                   _u_boot_list_2_uclass_2_spi_nor             76       -     -76
>                   _u_boot_list_2_uclass_2_spi_generic         76       -     -76
>                   _u_boot_list_2_uclass_2_spi                 76       -     -76
>                   spi_flash_std_erase                         84       -     -84
>                   spi_mem_default_supports_op                 86       -     -86
>                   omap3_spi_set_mode                          96       -     -96
>                   dm_spi_claim_bus                           100       -    -100
>                   omap3_spi_probe                            116       -    -116
>                   spi_slave_ofdata_to_platdata               212       -    -212
>                   spi_get_bus_and_cs                         232       -    -232
>                   omap3_spi_xfer                             796       -    -796
>              brsmarc1       : spl/u-boot-spl:all -2113 spl/u-boot-spl:bss -4 spl/u-boot-spl:data -436 spl/u-boot-spl:rodata -309 spl/u-boot-spl:text -1364
>                 spl-u-boot-spl: add: 3/-41, grow: 5/-2 bytes: 1310/-3100 (-1790)
>                   function                                   old     new   delta
>                   spi_xfer                                     6     800    +794
>                   spi_claim_bus                                6     248    +242
>                   spi_setup_slave                              -     156    +156
>                   spi_do_alloc_slave                           -      48     +48
>                   spi_flash_probe                             26      72     +46
>                   spl_spi_load_image                         124     140     +16
>                   spi_release_bus                              6      12      +6
>                   spi_free_slave                               -       2      +2
>                   spi_flash_std_remove                         4       -      -4
>                   spi_flash_post_bind                          4       -      -4
>                   omap4_pdata                                  4       -      -4
>                   omap2_pdata                                  4       -      -4
>                   dev_get_parent_priv                          6       -      -6
>                   spi_flash_cmd_get_sw_write_prot              8       -      -8
>                   spi_flash_std_get_sw_write_prot             14       -     -14
>                   spi_flash_read_dm                           14       -     -14
>                   dm_spi_release_bus                          14       -     -14
>                   ofnode_read_bool                            16       -     -16
>                   fdtdec_get_bool                             20       -     -20
>                   omap3_spi_release_bus                       22       -     -22
>                   spi_mem_adjust_op_size                      92      68     -24
>                   spi_child_post_bind                         30       -     -30
>                   spi_post_probe                              32       -     -32
>                   spi_flash_std_write                         34       -     -34
>                   spi_flash_std_read                          34       -     -34
>                   spi_child_pre_probe                         34       -     -34
>                   dm_spi_xfer                                 34       -     -34
>                   spi_mem_supports_op                         36       -     -36
>                   spi_flash_probe_bus_cs                      48       -     -48
>                   spi_find_chip_select                        50       -     -50
>                   omap3_spi_claim_bus                         54       -     -54
>                   static.spi_check_buswidth_req               56       -     -56
>                   omap3_spi_set_wordlen                       62       -     -62
>                   spi_mem_exec_op                            284     220     -64
>                   _u_boot_list_2_driver_2_spi_generic_drv      68       -     -68
>                   _u_boot_list_2_driver_2_spi_flash_std       68       -     -68
>                   _u_boot_list_2_driver_2_omap3_spi           68       -     -68
>                   spi_set_speed_mode                          72       -     -72
>                   spi_flash_std_probe                         76       -     -76
>                   omap3_spi_set_speed                         76       -     -76
>                   _u_boot_list_2_uclass_2_spi_nor             76       -     -76
>                   _u_boot_list_2_uclass_2_spi_generic         76       -     -76
>                   _u_boot_list_2_uclass_2_spi                 76       -     -76
>                   spi_flash_std_erase                         84       -     -84
>                   spi_mem_default_supports_op                 86       -     -86
>                   omap3_spi_set_mode                          96       -     -96
>                   dm_spi_claim_bus                           100       -    -100
>                   omap3_spi_probe                            116       -    -116
>                   spi_slave_ofdata_to_platdata               212       -    -212
>                   spi_get_bus_and_cs                         232       -    -232
>                   omap3_spi_xfer                             796       -    -796
>              stm32mp15_basic: spl/u-boot-spl:all -2312 spl/u-boot-spl:bss -772 spl/u-boot-spl:rodata -292 spl/u-boot-spl:text -1248
>                 spl-u-boot-spl: add: 0/-19, grow: 0/-2 bytes: 0/-2013 (-2013)
>                   function                                   old     new   delta
>                   sf_mtd_registered                            1       -      -1
>                   spi_flash_mtd_sync                           2       -      -2
>                   spi_flash_std_remove                        10       4      -6
>                   spi_flash_erase_dm                           8       -      -8
>                   sf_mtd_name                                  8       -      -8
>                   spi_flash_std_probe                         88      76     -12
>                   spi_flash_write_dm                          14       -     -14
>                   idr_remove                                  20       -     -20
>                   spi_flash_mtd_write                         38       -     -38
>                   spi_flash_mtd_read                          38       -     -38
>                   spi_flash_mtd_unregister                    52       -     -52
>                   spi_flash_mtd_erase                         78       -     -78
>                   mtd_unlock                                  80       -     -80
>                   del_mtd_device                              80       -     -80
>                   mtd_erase_callback                          88       -     -88
>                   part_erase                                  96       -     -96
>                   del_mtd_partitions                         136       -    -136
>                   spi_flash_mtd_register                     172       -    -172
>                   sf_mtd_info                                240       -    -240
>                   add_mtd_device                             328       -    -328
>                   mtd_idr                                    516       -    -516
> 
> 
> _______________________________________________
> U-Boot mailing list
> U-Boot@lists.denx.de
> https://lists.denx.de/listinfo/u-boot
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
