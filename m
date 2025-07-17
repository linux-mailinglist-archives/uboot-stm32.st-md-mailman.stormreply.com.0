Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A523FB1488C
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61D17C3F94D;
	Tue, 29 Jul 2025 06:49:43 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9521BC3F93E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jul 2025 02:44:29 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-41eaf6805ebso18034b6e.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jul 2025 19:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752720268; x=1753325068;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=whr21huSr9rKfrkk1irMz+8NGWPkaYCSzF7bVQoMKQ0=;
 b=x+ORuJ7JYXOUz4RXaLiTBxvkdzlQQD09jMOrAoGNxIREEPLflAlqGk7n23On+BcNGe
 CbtpYvJCPK4SMYF3VHIhIAqaEkFYSG5BZud6ufd90TbVR10xIGJULwB+ernS2zbZnMYa
 /aIG8aKJCSxbHmu2F+o65VhzIp4rA5vBWPgg1olrfuaeAsbnOFmjRfGO+QYi/9B5E6tE
 l44GTQV7+SIZAQs2eqiql7mDvbp94GeeeW2E9wr00SkFySmiuWyAByFTawydTsPdw5W0
 RTqLzoe7K5j/aqLfnx7Zs4U/TcZqRCfA+p2VbFZD1eh/aTGONDNBUnezn0VxSXWC6zgR
 OyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752720268; x=1753325068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=whr21huSr9rKfrkk1irMz+8NGWPkaYCSzF7bVQoMKQ0=;
 b=MnVW0Pz0aTkR0JTmOMTP5nbKiBpidGrvSOGhU/bgxiRyVWzhU1olPafaBPIeEfyike
 49vOxdVjG71dxmRvUxfo70z14GpwR0LEJ8H7l6+bozu1DnEZBemBk65MksobzTVBig16
 Pk9VZf/zA6VH0ruLsiOHpAUfyXDeMrtKn4FgB34dAxQ9ftA0kY4tdPH6kDVXVKai53eW
 V61LT1Xt88naZsHYLrStfg6E5qD19Bs0ZxRoN5GtfaxOI7w5R1/P4/VOQINL1yQLyKua
 DCHZgMgjZiDW3HGuaz3XGqgf5ui7yadVPDbP1Ufsq2AkaI4hV6Z+pLkLLUvP+t+f2ZQC
 0Jeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxYlk29RtwA+Bv8RP/ZOwCi/mDXk5xFjyrQs2kaucwHap57d1ARhiBjac+HeGHsuCWUYBiGHg5BIATTg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwZwdXfWc2vSZhkd7oZJwsh1KketACA/K1wKa5RZ7GIdz+/F+0e
 q64TaMtG1m9tBX5PCcCTisgcbysAQYQaXnoAT4PnxHSaSLPKgTUWMCmkJ04ALSzXNQ8=
X-Gm-Gg: ASbGncuN4WpleJbrcLim/h1Tu4C5dgFzVAIRwA8eLDLcr5+SlLTVmM1nrPxGbhGJLvN
 /tCdgKYtxhEKgqYjNj9gmYULi7ZpWVxco6elzqmFOjNjP+JJ3ehrVre6Ip5jJfSSXyK8klMreq9
 T8o74QM6iqTl1MOsaB6gsFm1GueksYxiKhUpfVID8C8fs47IEGJH0mNhUwN5U1mzvA9cJ7QAYlT
 cwB2RNIcVBltkrL6jwZ76hVbsd/V+kkmzwxxT5Trt8quUphFNin0ipdri8KdrN7nFSSc0M/l49w
 8ZzQK01b6BB/os8NYcwcm6Fnq1JmVb89x+Ja22efL1WEP88uuydl22zcr41KLEcmTw9E/brUij6
 RgLM29A1CjHCzKcoU0lso6Ow7HyGgawvq
X-Google-Smtp-Source: AGHT+IFJeLOc0zcov3lykbEqsDZKWMuuVeXeISx7+DcLLgeldLt1nhrcEjrZw0VF1X7Y488qf/1cyA==
X-Received: by 2002:a05:6808:148a:b0:40a:52e5:37d3 with SMTP id
 5614622812f47-41cee27714amr3989626b6e.3.1752720267328; 
 Wed, 16 Jul 2025 19:44:27 -0700 (PDT)
Received: from localhost ([2605:a601:a0f4:b000:264b:feff:fe59:d7f7])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4141c78838asm3215272b6e.46.2025.07.16.19.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 19:44:26 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Tom Rini <trini@konsulko.com>
Date: Wed, 16 Jul 2025 21:44:26 -0500
Message-Id: <20250717024426.26953-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:49:34 +0000
Cc: Nishanth Menon <nm@ti.com>, Kursad Oney <kursad.oney@broadcom.com>,
 Peng Fan <peng.fan@nxp.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Jim Liu <JJLIU0@nuvoton.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Sean Anderson <seanga2@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 liuhao <liuhao@phytium.com.cn>, Jan Kiszka <jan.kiszka@siemens.com>,
 Garrett Giordano <ggiordano@phytec.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Marek Vasut <marex@denx.de>, weichangzheng <weichangzheng@phytium.com.cn>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 open list <u-boot@lists.denx.de>, Adam Ford <aford173@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Le Jin <le.jin@siemens.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Hugues Kamba Mpiana <hugues.kambampiana@arm.com>,
 Michal Simek <michal.simek@amd.com>, Ben Horgan <ben.horgan@arm.com>,
 Sam Shih <sam.shih@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Julien Masson <jmasson@baylibre.com>,
 Stanley Chu <yschu@nuvoton.com>, Anand Gore <anand.gore@broadcom.com>,
 William Zhang <william.zhang@broadcom.com>, Eric Nelson <eric@nelint.com>,
 Paul Barker <paul@pbarker.dev>, u-boot@dh-electronics.com,
 Sergey Temerkhanov <s.temerkhanov@gmail.com>, lixinde <lixinde@phytium.com.cn>,
 Huan Zhou <pericycle.cc@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 shuyiqi <shuyiqi@phytium.com.cn>, Apurva Nandan <a-nandan@ti.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Wadim Egorov <w.egorov@phytec.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabien Parent <fparent@baylibre.com>, Vaishnav Achath <vaishnav.a@ti.com>,
 Simon Glass <sjg@chromium.org>, Gilles Talis <gilles.talis@gmail.com>,
 u-boot-amlogic@groups.io, Manorit Chawdhry <m-chawdhry@ti.com>,
 Kamil Lulko <kamil.lulko@gmail.com>, Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Michael Walle <michael@walle.cc>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Bryan Brattlof <bb@ti.com>, Stefano Babic <sbabic@nabladev.com>
Subject: [Uboot-stm32] [PATCH] treewide: Remove empty board_init() function
	from all boards
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

Commit 86acdce2ba88 ("common: add config for board_init() call")
introduced CONFIG_BOARD_INIT option. This option can be disabled for the
boards where board_init() function is not needed. Remove empty
board_init() calls for all boards where it's possible, and disable
CONFIG_BOARD_INIT in all related defconfigs.

This cleanup was made semi-automatically using these scripts: [1].

No functional change, but the binary size for the modified boards is
reduced a bit.

[1] https://github.com/joe-skb7/uboot-convert-scripts/tree/master/remove-board-init

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---

Although I did this cleanup as carefully as I could, and ran buildman
for all changed boards/configs, I wasn't able to check some boards,
because the build process for those boards is complicated and buildman
tool just fails for those when ran locally. So I'd recommend to run a CI
job (buildman) for this patch to make sure it's clean before actually
merging it.

There are only two remaining board files having empty board_init()
function:

    $ grep -Pzrl "\bboard_init\(void\)\n{\n.*return 0;\n}\n" board/

    board/BuR/zynq/common/board.c
    board/renesas/common/rcar64-common.c

The first one only has empty board_init() in case of U-Boot proper
build, but it's not empty in case of SPL build. The second one has
__weak board_init(), so it should be left as is, as it's a common board
file which can be used by specific board files later.

This patch only reworks board/ directory, so arch/ has to be handled
separately later.

 board/Marvell/octeontx2/board.c                             | 5 -----
 board/amlogic/odroid-go-ultra/odroid-go-ultra.c             | 5 -----
 board/armltd/corstone1000/corstone1000.c                    | 5 -----
 board/armltd/total_compute/total_compute.c                  | 5 -----
 board/beacon/imx8mm/imx8mm_beacon.c                         | 5 -----
 board/beacon/imx8mn/imx8mn_beacon.c                         | 5 -----
 board/beagle/beagleboneai64/beagleboneai64.c                | 5 -----
 board/beagle/beagleplay/beagleplay.c                        | 5 -----
 board/beagle/beagley-ai/beagley-ai.c                        | 5 -----
 board/broadcom/bcmbca/board.c                               | 5 -----
 board/broadcom/bcmns/ns.c                                   | 5 -----
 board/broadcom/bcmstb/bcmstb.c                              | 5 -----
 board/bsh/imx8mn_smm_s2/imx8mn_smm_s2.c                     | 5 -----
 board/canaan/k230_canmv/board.c                             | 4 ----
 board/cavium/thunderx/thunderx.c                            | 5 -----
 board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sbc.c | 5 -----
 board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.c | 5 -----
 board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c           | 5 -----
 board/emcraft/imx8mp_navqp/imx8mp_navqp.c                   | 4 ----
 board/emulation/qemu-arm/qemu-arm.c                         | 5 -----
 board/emulation/qemu-riscv/qemu-riscv.c                     | 5 -----
 board/emulation/qemu-sbsa/qemu-sbsa.c                       | 5 -----
 board/emulation/qemu-xtensa/qemu-xtensa.c                   | 5 -----
 board/engicam/stm32mp1/stm32mp1.c                           | 6 ------
 board/freescale/imx8mp_evk/imx8mp_evk.c                     | 6 ------
 board/freescale/imx91_evk/imx91_evk.c                       | 5 -----
 board/freescale/imx93_qsb/imx93_qsb.c                       | 5 -----
 board/freescale/imx95_evk/imx95_evk.c                       | 5 -----
 board/freescale/mx6memcal/mx6memcal.c                       | 5 -----
 board/hisilicon/hikey/hikey.c                               | 5 -----
 board/kontron/sl-mx8mm/sl-mx8mm.c                           | 5 -----
 board/kontron/sl28/sl28.c                                   | 5 -----
 board/mediatek/mt7622/mt7622_rfb.c                          | 5 -----
 board/mediatek/mt7981/mt7981_rfb.c                          | 4 ----
 board/mediatek/mt7986/mt7986_rfb.c                          | 4 ----
 board/mediatek/mt7987/mt7987_rfb.c                          | 4 ----
 board/mediatek/mt7988/mt7988_rfb.c                          | 4 ----
 board/mediatek/mt8365_evk/mt8365_evk.c                      | 5 -----
 board/mediatek/mt8516/mt8516_pumpkin.c                      | 5 -----
 board/nuvoton/arbel_evb/arbel_evb.c                         | 5 -----
 board/nuvoton/poleg_evb/poleg_evb.c                         | 5 -----
 board/openpiton/riscv64/openpiton-riscv64.c                 | 5 -----
 board/phytec/phycore_am62ax/phycore-am62ax.c                | 5 -----
 board/phytec/phycore_am62x/phycore-am62x.c                  | 5 -----
 board/phytec/phycore_am64x/phycore-am64x.c                  | 5 -----
 board/phytium/durian/durian.c                               | 5 -----
 board/phytium/pe2201/pe2201.c                               | 5 -----
 board/phytium/pomelo/pomelo.c                               | 5 -----
 board/renesas/r2dplus/r2dplus.c                             | 5 -----
 board/renesas/rzg2l/rzg2l.c                                 | 5 -----
 board/samsung/e850-96/e850-96.c                             | 5 -----
 board/sandbox/sandbox.c                                     | 5 -----
 board/siemens/iot2050/board.c                               | 5 -----
 board/sipeed/maix/maix.c                                    | 5 -----
 board/sophgo/licheerv_nano/board.c                          | 4 ----
 board/spacemit/bananapi-f3/board.c                          | 4 ----
 board/st/stih410-b2260/board.c                              | 5 -----
 board/st/stm32f429-discovery/stm32f429-discovery.c          | 5 -----
 board/st/stm32f429-evaluation/stm32f429-evaluation.c        | 5 -----
 board/st/stm32f469-discovery/stm32f469-discovery.c          | 5 -----
 board/st/stm32h743-disco/stm32h743-disco.c                  | 5 -----
 board/st/stm32h743-eval/stm32h743-eval.c                    | 5 -----
 board/st/stm32h747-disco/stm32h747-disco.c                  | 5 -----
 board/st/stm32h750-art-pi/stm32h750-art-pi.c                | 5 -----
 board/ti/am62ax/evm.c                                       | 5 -----
 board/ti/am62px/evm.c                                       | 5 -----
 board/ti/am62x/evm.c                                        | 5 -----
 board/ti/am64x/evm.c                                        | 5 -----
 board/ti/am65x/evm.c                                        | 5 -----
 board/ti/j721e/evm.c                                        | 5 -----
 board/ti/j721s2/evm.c                                       | 5 -----
 board/ti/j722s/evm.c                                        | 5 -----
 board/ti/j784s4/evm.c                                       | 5 -----
 board/toradex/smarc-imx8mp/smarc-imx8mp.c                   | 5 -----
 board/toradex/verdin-am62/verdin-am62.c                     | 5 -----
 board/toradex/verdin-am62p/verdin-am62p.c                   | 5 -----
 board/variscite/imx8mn_var_som/imx8mn_var_som.c             | 5 -----
 board/xen/xenguest_arm64/xenguest_arm64.c                   | 5 -----
 board/xilinx/mbv/board.c                                    | 5 -----
 board/xilinx/zynqmp_r5/board.c                              | 5 -----
 configs/am62ax_evm_r5_defconfig                             | 1 +
 configs/am62px_evm_r5_defconfig                             | 1 +
 configs/am62x_a53_usbdfu.config                             | 1 +
 configs/am62x_beagleplay_r5_defconfig                       | 1 +
 configs/am62x_evm_r5_defconfig                              | 1 +
 configs/am64x_evm_a53_defconfig                             | 1 +
 configs/am64x_evm_r5_defconfig                              | 1 +
 configs/am65x_evm_a53_defconfig                             | 1 +
 configs/am65x_evm_r5_defconfig                              | 1 +
 configs/am65x_evm_r5_usbmsc_defconfig                       | 1 +
 configs/am67a_beagley_ai_a53_defconfig                      | 1 +
 configs/am67a_beagley_ai_r5_defconfig                       | 1 +
 configs/arbel_evb_defconfig                                 | 1 +
 configs/bananapi-f3_defconfig                               | 1 +
 configs/bcm7260_defconfig                                   | 1 +
 configs/bcm7445_defconfig                                   | 1 +
 configs/bcm947622_defconfig                                 | 1 +
 configs/bcm94908_defconfig                                  | 1 +
 configs/bcm94912_defconfig                                  | 1 +
 configs/bcm963138_defconfig                                 | 1 +
 configs/bcm963146_defconfig                                 | 1 +
 configs/bcm963148_defconfig                                 | 1 +
 configs/bcm963158_defconfig                                 | 1 +
 configs/bcm963178_defconfig                                 | 1 +
 configs/bcm96756_defconfig                                  | 1 +
 configs/bcm96813_defconfig                                  | 1 +
 configs/bcm96846_defconfig                                  | 1 +
 configs/bcm96855_defconfig                                  | 1 +
 configs/bcm96856_defconfig                                  | 1 +
 configs/bcm96858_defconfig                                  | 1 +
 configs/bcm96878_defconfig                                  | 1 +
 configs/bcmns_defconfig                                     | 1 +
 configs/corstone1000_defconfig                              | 1 +
 configs/durian_defconfig                                    | 1 +
 configs/e850-96_defconfig                                   | 1 +
 configs/hikey_defconfig                                     | 1 +
 configs/imx8m_data_modul.config                             | 1 +
 configs/imx8mm_beacon_defconfig                             | 1 +
 configs/imx8mm_beacon_fspi_defconfig                        | 1 +
 configs/imx8mn_beacon_2g_defconfig                          | 1 +
 configs/imx8mn_beacon_defconfig                             | 1 +
 configs/imx8mn_beacon_fspi_defconfig                        | 1 +
 configs/imx8mn_bsh_smm_s2_defconfig                         | 2 +-
 configs/imx8mn_bsh_smm_s2pro_defconfig                      | 2 +-
 configs/imx8mn_var_som_defconfig                            | 2 +-
 configs/imx8mp_dhsom.config                                 | 1 +
 configs/imx8mp_evk_defconfig                                | 1 +
 configs/imx8mp_navqp_defconfig                              | 1 +
 configs/imx91_11x11_evk_defconfig                           | 2 +-
 configs/imx91_11x11_evk_inline_ecc_defconfig                | 2 +-
 configs/imx93_9x9_qsb_defconfig                             | 1 +
 configs/imx93_9x9_qsb_inline_ecc_defconfig                  | 1 +
 configs/imx95_19x19_evk_defconfig                           | 2 +-
 configs/iot2050_defconfig                                   | 1 +
 configs/j7200_evm_a72_defconfig                             | 1 +
 configs/j721e_beagleboneai64_a72_defconfig                  | 1 +
 configs/j721e_beagleboneai64_r5_defconfig                   | 1 +
 configs/j721e_evm_a72_defconfig                             | 1 +
 configs/j721e_evm_r5_defconfig                              | 1 +
 configs/j721s2_evm_a72_defconfig                            | 1 +
 configs/j721s2_evm_r5_defconfig                             | 1 +
 configs/j722s_evm_a53_defconfig                             | 1 +
 configs/j722s_evm_r5_defconfig                              | 1 +
 configs/j784s4_evm_a72_defconfig                            | 1 +
 configs/j784s4_evm_r5_defconfig                             | 1 +
 configs/k230_canmv_defconfig                                | 1 +
 configs/kontron-sl-mx8mm_defconfig                          | 1 +
 configs/kontron_sl28_defconfig                              | 1 +
 configs/mt7622_rfb_defconfig                                | 1 +
 configs/mt7981_emmc_rfb_defconfig                           | 1 +
 configs/mt7981_rfb_defconfig                                | 1 +
 configs/mt7981_sd_rfb_defconfig                             | 1 +
 configs/mt7986_rfb_defconfig                                | 1 +
 configs/mt7986a_bpir3_emmc_defconfig                        | 1 +
 configs/mt7986a_bpir3_sd_defconfig                          | 1 +
 configs/mt7987_emmc_rfb_defconfig                           | 1 +
 configs/mt7987_rfb_defconfig                                | 1 +
 configs/mt7987_sd_rfb_defconfig                             | 1 +
 configs/mt7988_rfb_defconfig                                | 1 +
 configs/mt7988_sd_rfb_defconfig                             | 1 +
 configs/mt8365_evk_defconfig                                | 1 +
 configs/mt8516_pumpkin_defconfig                            | 1 +
 configs/mx6memcal_defconfig                                 | 1 +
 configs/octeontx2_95xx_defconfig                            | 1 +
 configs/octeontx2_96xx_defconfig                            | 1 +
 configs/odroid-go-ultra_defconfig                           | 1 +
 configs/openpiton_riscv64_defconfig                         | 1 +
 configs/openpiton_riscv64_spl_defconfig                     | 1 +
 configs/pe2201_defconfig                                    | 1 +
 configs/phycore_am62ax_a53_defconfig                        | 1 +
 configs/phycore_am62ax_r5_defconfig                         | 1 +
 configs/phycore_am62x_a53_defconfig                         | 1 +
 configs/phycore_am62x_r5_defconfig                          | 1 +
 configs/phycore_am64x_a53_defconfig                         | 1 +
 configs/phycore_am64x_r5_defconfig                          | 1 +
 configs/poleg_evb_defconfig                                 | 1 +
 configs/pomelo_defconfig                                    | 1 +
 configs/qemu-arm-sbsa_defconfig                             | 1 +
 configs/qemu-riscv32_defconfig                              | 1 +
 configs/qemu-riscv32_smode_defconfig                        | 1 +
 configs/qemu-riscv32_spl_defconfig                          | 1 +
 configs/qemu-riscv64_defconfig                              | 1 +
 configs/qemu-riscv64_smode_defconfig                        | 1 +
 configs/qemu-riscv64_spl_defconfig                          | 1 +
 configs/qemu_arm64_defconfig                                | 1 +
 configs/qemu_arm_defconfig                                  | 1 +
 configs/renesas_rzg2l_smarc_defconfig                       | 1 +
 configs/sandbox64_defconfig                                 | 1 +
 configs/sandbox_defconfig                                   | 1 +
 configs/sandbox_flattree_defconfig                          | 1 +
 configs/sandbox_noinst_defconfig                            | 1 +
 configs/sandbox_spl_defconfig                               | 1 +
 configs/sandbox_vpl_defconfig                               | 1 +
 configs/sipeed_licheerv_nano_defconfig                      | 1 +
 configs/sipeed_maix_bitm_defconfig                          | 1 +
 configs/sipeed_maix_smode_defconfig                         | 1 +
 configs/stih410-b2260_defconfig                             | 1 +
 configs/stm32f429-discovery_defconfig                       | 1 +
 configs/stm32f429-evaluation_defconfig                      | 1 +
 configs/stm32f469-discovery_defconfig                       | 1 +
 configs/stm32h743-disco_defconfig                           | 1 +
 configs/stm32h743-eval_defconfig                            | 1 +
 configs/stm32h747-disco_defconfig                           | 1 +
 configs/stm32h750-art-pi_defconfig                          | 1 +
 configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig          | 1 +
 configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig         | 1 +
 configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig | 1 +
 configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig     | 1 +
 configs/thunderx_88xx_defconfig                             | 1 +
 configs/tools-only_defconfig                                | 1 +
 configs/toradex-smarc-imx8mp_defconfig                      | 2 +-
 configs/total_compute_defconfig                             | 1 +
 configs/verdin-am62_a53_defconfig                           | 1 +
 configs/verdin-am62_r5_defconfig                            | 1 +
 configs/verdin-am62p_a53_defconfig                          | 1 +
 configs/verdin-am62p_r5_defconfig                           | 1 +
 configs/xenguest_arm64_defconfig                            | 1 +
 configs/xenguest_arm64_virtio_defconfig                     | 1 +
 configs/xilinx_mbv32_defconfig                              | 1 +
 configs/xilinx_mbv32_smode_defconfig                        | 1 +
 configs/xilinx_mbv64_defconfig                              | 1 +
 configs/xilinx_mbv64_smode_defconfig                        | 1 +
 configs/xilinx_zynqmp_r5_defconfig                          | 1 +
 223 files changed, 143 insertions(+), 401 deletions(-)

diff --git a/board/Marvell/octeontx2/board.c b/board/Marvell/octeontx2/board.c
index 01ba53cf68d1..1bea5a605137 100644
--- a/board/Marvell/octeontx2/board.c
+++ b/board/Marvell/octeontx2/board.c
@@ -93,11 +93,6 @@ int board_early_init_r(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 int timer_init(void)
 {
 	return 0;
diff --git a/board/amlogic/odroid-go-ultra/odroid-go-ultra.c b/board/amlogic/odroid-go-ultra/odroid-go-ultra.c
index f94120717377..fc0057746e0d 100644
--- a/board/amlogic/odroid-go-ultra/odroid-go-ultra.c
+++ b/board/amlogic/odroid-go-ultra/odroid-go-ultra.c
@@ -13,8 +13,3 @@ int mmc_get_env_dev(void)
 		return 1;
 	return 0;
 }
-
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
index 3ad77f51949f..16d0e679c3e2 100644
--- a/board/armltd/corstone1000/corstone1000.c
+++ b/board/armltd/corstone1000/corstone1000.c
@@ -77,11 +77,6 @@ static struct mm_region corstone1000_mem_map[] = {
 
 struct mm_region *mem_map = corstone1000_mem_map;
 
-int board_init(void)
-{
-	return 0;
-}
-
 int dram_init(void)
 {
 	gd->ram_size = PHYS_SDRAM_1_SIZE;
diff --git a/board/armltd/total_compute/total_compute.c b/board/armltd/total_compute/total_compute.c
index 75bc6b0631f2..12bb6defab25 100644
--- a/board/armltd/total_compute/total_compute.c
+++ b/board/armltd/total_compute/total_compute.c
@@ -70,11 +70,6 @@ int misc_init_r(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 int dram_init(void)
 {
 	return fdtdec_setup_mem_size_base();
diff --git a/board/beacon/imx8mm/imx8mm_beacon.c b/board/beacon/imx8mm/imx8mm_beacon.c
index 204235a3f8e0..6459a99cb9d7 100644
--- a/board/beacon/imx8mm/imx8mm_beacon.c
+++ b/board/beacon/imx8mm/imx8mm_beacon.c
@@ -6,8 +6,3 @@
 #include <asm/global_data.h>
 
 DECLARE_GLOBAL_DATA_PTR;
-
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/beacon/imx8mn/imx8mn_beacon.c b/board/beacon/imx8mn/imx8mn_beacon.c
index 204235a3f8e0..6459a99cb9d7 100644
--- a/board/beacon/imx8mn/imx8mn_beacon.c
+++ b/board/beacon/imx8mn/imx8mn_beacon.c
@@ -6,8 +6,3 @@
 #include <asm/global_data.h>
 
 DECLARE_GLOBAL_DATA_PTR;
-
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/beagle/beagleboneai64/beagleboneai64.c b/board/beagle/beagleboneai64/beagleboneai64.c
index 99eb8972cf3d..500fcc58ed81 100644
--- a/board/beagle/beagleboneai64/beagleboneai64.c
+++ b/board/beagle/beagleboneai64/beagleboneai64.c
@@ -45,11 +45,6 @@ struct efi_capsule_update_info update_info = {
 	.images = fw_images,
 };
 
-int board_init(void)
-{
-	return 0;
-}
-
 int dram_init(void)
 {
 	return fdtdec_setup_mem_size_base();
diff --git a/board/beagle/beagleplay/beagleplay.c b/board/beagle/beagleplay/beagleplay.c
index 786358105854..9bc9ca30e952 100644
--- a/board/beagle/beagleplay/beagleplay.c
+++ b/board/beagle/beagleplay/beagleplay.c
@@ -41,11 +41,6 @@ struct efi_capsule_update_info update_info = {
 	.images = fw_images,
 };
 
-int board_init(void)
-{
-	return 0;
-}
-
 int dram_init(void)
 {
 	return fdtdec_setup_mem_size_base();
diff --git a/board/beagle/beagley-ai/beagley-ai.c b/board/beagle/beagley-ai/beagley-ai.c
index 9786f628f6d6..26fa54e27bbe 100644
--- a/board/beagle/beagley-ai/beagley-ai.c
+++ b/board/beagle/beagley-ai/beagley-ai.c
@@ -21,11 +21,6 @@ void set_dfu_alt_info(char *interface, char *devstr)
 }
 #endif
 
-int board_init(void)
-{
-	return 0;
-}
-
 int dram_init(void)
 {
 	return fdtdec_setup_mem_size_base();
diff --git a/board/broadcom/bcmbca/board.c b/board/broadcom/bcmbca/board.c
index a6ced92565f9..1ab6224011cb 100644
--- a/board/broadcom/bcmbca/board.c
+++ b/board/broadcom/bcmbca/board.c
@@ -5,11 +5,6 @@
 
 #include <fdtdec.h>
 
-int board_init(void)
-{
-	return 0;
-}
-
 int dram_init(void)
 {
 	if (fdtdec_setup_mem_size_base() != 0)
diff --git a/board/broadcom/bcmns/ns.c b/board/broadcom/bcmns/ns.c
index 45cc62936cec..47a01227a353 100644
--- a/board/broadcom/bcmns/ns.c
+++ b/board/broadcom/bcmns/ns.c
@@ -31,11 +31,6 @@ int board_late_init(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 void reset_cpu(void)
 {
 }
diff --git a/board/broadcom/bcmstb/bcmstb.c b/board/broadcom/bcmstb/bcmstb.c
index e655f610c843..e7313d8c4311 100644
--- a/board/broadcom/bcmstb/bcmstb.c
+++ b/board/broadcom/bcmstb/bcmstb.c
@@ -32,11 +32,6 @@ union reg_value_union {
 	const phys_addr_t *address;
 };
 
-int board_init(void)
-{
-	return 0;
-}
-
 void reset_cpu(void)
 {
 }
diff --git a/board/bsh/imx8mn_smm_s2/imx8mn_smm_s2.c b/board/bsh/imx8mn_smm_s2/imx8mn_smm_s2.c
index c99896873991..c4a85c4aa440 100644
--- a/board/bsh/imx8mn_smm_s2/imx8mn_smm_s2.c
+++ b/board/bsh/imx8mn_smm_s2/imx8mn_smm_s2.c
@@ -6,11 +6,6 @@
 #include <asm/arch/sys_proto.h>
 #include <env.h>
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	if (is_usb_boot()) {
diff --git a/board/canaan/k230_canmv/board.c b/board/canaan/k230_canmv/board.c
index a705ee8f67be..7d012df214fa 100644
--- a/board/canaan/k230_canmv/board.c
+++ b/board/canaan/k230_canmv/board.c
@@ -3,7 +3,3 @@
  * Copyright (c) 2025, Junhui Liu <junhui.liu@pigmoral.tech>
  */
 
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/cavium/thunderx/thunderx.c b/board/cavium/thunderx/thunderx.c
index b1a805c13609..4c477ad551c8 100644
--- a/board/cavium/thunderx/thunderx.c
+++ b/board/cavium/thunderx/thunderx.c
@@ -72,11 +72,6 @@ static struct mm_region thunderx_mem_map[] = {
 
 struct mm_region *mem_map = thunderx_mem_map;
 
-int board_init(void)
-{
-	return 0;
-}
-
 int timer_init(void)
 {
 	return 0;
diff --git a/board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sbc.c b/board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sbc.c
index 339702e83927..e271d060efa6 100644
--- a/board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sbc.c
+++ b/board/data_modul/imx8mm_edm_sbc/imx8mm_data_modul_edm_sbc.c
@@ -16,11 +16,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	struct udevice *dev;
diff --git a/board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.c b/board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.c
index 138acd36ad24..d6f0a917023d 100644
--- a/board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.c
+++ b/board/data_modul/imx8mp_edm_sbc/imx8mp_data_modul_edm_sbc.c
@@ -46,11 +46,6 @@ enum env_location env_get_location(enum env_operation op, int prio)
 	return prio ? ENVL_UNKNOWN : ENVL_MMC;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	struct udevice *dev;
diff --git a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
index 4275436b1284..3a890c5920c4 100644
--- a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
+++ b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
@@ -153,11 +153,6 @@ void dh_add_item_number_and_serial_to_env(struct eeprom_id_page *eip)
 	}
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	u8 eeprom_buffer[DH_EEPROM_ID_PAGE_MAX_SIZE] = { 0 };
diff --git a/board/emcraft/imx8mp_navqp/imx8mp_navqp.c b/board/emcraft/imx8mp_navqp/imx8mp_navqp.c
index 219efdddcb5e..04b3bc8caf5d 100644
--- a/board/emcraft/imx8mp_navqp/imx8mp_navqp.c
+++ b/board/emcraft/imx8mp_navqp/imx8mp_navqp.c
@@ -4,7 +4,3 @@
  * Copyright 2024 Gilles Talis <gilles.talis@gmail.com>
  */
 
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/emulation/qemu-arm/qemu-arm.c b/board/emulation/qemu-arm/qemu-arm.c
index 31f5a7751370..38f0ec5f2fbb 100644
--- a/board/emulation/qemu-arm/qemu-arm.c
+++ b/board/emulation/qemu-arm/qemu-arm.c
@@ -102,11 +102,6 @@ static struct mm_region qemu_arm64_mem_map[] = {
 struct mm_region *mem_map = qemu_arm64_mem_map;
 #endif
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	/*
diff --git a/board/emulation/qemu-riscv/qemu-riscv.c b/board/emulation/qemu-riscv/qemu-riscv.c
index 70190ebe8fcc..97c8211c1008 100644
--- a/board/emulation/qemu-riscv/qemu-riscv.c
+++ b/board/emulation/qemu-riscv/qemu-riscv.c
@@ -28,11 +28,6 @@ int is_flash_available(void)
 }
 #endif
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	/* start usb so that usb keyboard can be used as input device */
diff --git a/board/emulation/qemu-sbsa/qemu-sbsa.c b/board/emulation/qemu-sbsa/qemu-sbsa.c
index cf1d5acf5cb4..30b3a41a9e97 100644
--- a/board/emulation/qemu-sbsa/qemu-sbsa.c
+++ b/board/emulation/qemu-sbsa/qemu-sbsa.c
@@ -93,11 +93,6 @@ int board_late_init(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 /**
  * dtb_dt_qemu - Return the address of the QEMU provided FDT.
  *
diff --git a/board/emulation/qemu-xtensa/qemu-xtensa.c b/board/emulation/qemu-xtensa/qemu-xtensa.c
index 0ca83341c25c..2e2a5a26d942 100644
--- a/board/emulation/qemu-xtensa/qemu-xtensa.c
+++ b/board/emulation/qemu-xtensa/qemu-xtensa.c
@@ -13,11 +13,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-int board_init(void)
-{
-	return 0;
-}
-
 unsigned long get_board_sys_clk(void)
 {
 	return gd->cpu_clk ? gd->cpu_clk : 40000000;
diff --git a/board/engicam/stm32mp1/stm32mp1.c b/board/engicam/stm32mp1/stm32mp1.c
index 56557d564298..82278a48ae84 100644
--- a/board/engicam/stm32mp1/stm32mp1.c
+++ b/board/engicam/stm32mp1/stm32mp1.c
@@ -34,12 +34,6 @@ int checkboard(void)
 	return 0;
 }
 
-/* board dependent setup after realloc */
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	return 0;
diff --git a/board/freescale/imx8mp_evk/imx8mp_evk.c b/board/freescale/imx8mp_evk/imx8mp_evk.c
index 2a9ba7df2bb3..732c0fa561d7 100644
--- a/board/freescale/imx8mp_evk/imx8mp_evk.c
+++ b/board/freescale/imx8mp_evk/imx8mp_evk.c
@@ -28,12 +28,6 @@ struct efi_capsule_update_info update_info = {
 };
 #endif /* EFI_HAVE_CAPSULE_SUPPORT */
 
-
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 #if CONFIG_IS_ENABLED(ENV_IS_IN_MMC)
diff --git a/board/freescale/imx91_evk/imx91_evk.c b/board/freescale/imx91_evk/imx91_evk.c
index 83bfca2f22d2..cbd0a72bf4b3 100644
--- a/board/freescale/imx91_evk/imx91_evk.c
+++ b/board/freescale/imx91_evk/imx91_evk.c
@@ -9,11 +9,6 @@
 #include <netdev.h>
 #include <asm/arch/sys_proto.h>
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 #ifdef CONFIG_ENV_IS_IN_MMC
diff --git a/board/freescale/imx93_qsb/imx93_qsb.c b/board/freescale/imx93_qsb/imx93_qsb.c
index 388d99106db2..503a86672459 100644
--- a/board/freescale/imx93_qsb/imx93_qsb.c
+++ b/board/freescale/imx93_qsb/imx93_qsb.c
@@ -9,11 +9,6 @@
 #include <netdev.h>
 #include <asm/arch/sys_proto.h>
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 #ifdef CONFIG_ENV_IS_IN_MMC
diff --git a/board/freescale/imx95_evk/imx95_evk.c b/board/freescale/imx95_evk/imx95_evk.c
index d5f5e310b6b6..fe0111be5081 100644
--- a/board/freescale/imx95_evk/imx95_evk.c
+++ b/board/freescale/imx95_evk/imx95_evk.c
@@ -15,11 +15,6 @@ int board_early_init_f(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	if (IS_ENABLED(CONFIG_ENV_IS_IN_MMC))
diff --git a/board/freescale/mx6memcal/mx6memcal.c b/board/freescale/mx6memcal/mx6memcal.c
index 17095c34e926..a58ab93f27dc 100644
--- a/board/freescale/mx6memcal/mx6memcal.c
+++ b/board/freescale/mx6memcal/mx6memcal.c
@@ -13,11 +13,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-int board_init(void)
-{
-	return 0;
-}
-
 int checkboard(void)
 {
 	puts("Board: mx6memcal\n");
diff --git a/board/hisilicon/hikey/hikey.c b/board/hisilicon/hikey/hikey.c
index 29165266630c..5e60ab9d7b71 100644
--- a/board/hisilicon/hikey/hikey.c
+++ b/board/hisilicon/hikey/hikey.c
@@ -372,11 +372,6 @@ int misc_init_r(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 #ifdef CONFIG_MMC
 
 static int init_dwmmc(void)
diff --git a/board/kontron/sl-mx8mm/sl-mx8mm.c b/board/kontron/sl-mx8mm/sl-mx8mm.c
index 8dcc2ea54f64..2e387038395f 100644
--- a/board/kontron/sl-mx8mm/sl-mx8mm.c
+++ b/board/kontron/sl-mx8mm/sl-mx8mm.c
@@ -116,11 +116,6 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 	return fdt_fixup_memory(blob, PHYS_SDRAM, gd->ram_size);
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	if (!fdt_node_check_compatible(gd->fdt_blob, 0, "kontron,imx8mm-n802x-som") ||
diff --git a/board/kontron/sl28/sl28.c b/board/kontron/sl28/sl28.c
index 0baf5c63f189..8a9502037fb6 100644
--- a/board/kontron/sl28/sl28.c
+++ b/board/kontron/sl28/sl28.c
@@ -51,11 +51,6 @@ int board_early_init_f(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_eth_init(struct bd_info *bis)
 {
 	return pci_eth_init(bis);
diff --git a/board/mediatek/mt7622/mt7622_rfb.c b/board/mediatek/mt7622/mt7622_rfb.c
index 9d24c8cd412c..405f393aade1 100644
--- a/board/mediatek/mt7622/mt7622_rfb.c
+++ b/board/mediatek/mt7622/mt7622_rfb.c
@@ -10,8 +10,3 @@
 #include <asm/global_data.h>
 
 DECLARE_GLOBAL_DATA_PTR;
-
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/mediatek/mt7981/mt7981_rfb.c b/board/mediatek/mt7981/mt7981_rfb.c
index 846c715ca051..0ca87a88aedd 100644
--- a/board/mediatek/mt7981/mt7981_rfb.c
+++ b/board/mediatek/mt7981/mt7981_rfb.c
@@ -4,7 +4,3 @@
  * Author: Sam Shih <sam.shih@mediatek.com>
  */
 
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/mediatek/mt7986/mt7986_rfb.c b/board/mediatek/mt7986/mt7986_rfb.c
index 846c715ca051..0ca87a88aedd 100644
--- a/board/mediatek/mt7986/mt7986_rfb.c
+++ b/board/mediatek/mt7986/mt7986_rfb.c
@@ -4,7 +4,3 @@
  * Author: Sam Shih <sam.shih@mediatek.com>
  */
 
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/mediatek/mt7987/mt7987_rfb.c b/board/mediatek/mt7987/mt7987_rfb.c
index fcb844deed83..c5cb33f06f76 100644
--- a/board/mediatek/mt7987/mt7987_rfb.c
+++ b/board/mediatek/mt7987/mt7987_rfb.c
@@ -4,7 +4,3 @@
  * Author: Sam Shih <sam.shih@mediatek.com>
  */
 
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/mediatek/mt7988/mt7988_rfb.c b/board/mediatek/mt7988/mt7988_rfb.c
index 846c715ca051..0ca87a88aedd 100644
--- a/board/mediatek/mt7988/mt7988_rfb.c
+++ b/board/mediatek/mt7988/mt7988_rfb.c
@@ -4,7 +4,3 @@
  * Author: Sam Shih <sam.shih@mediatek.com>
  */
 
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/mediatek/mt8365_evk/mt8365_evk.c b/board/mediatek/mt8365_evk/mt8365_evk.c
index 723a50fec007..41a6febf03d5 100644
--- a/board/mediatek/mt8365_evk/mt8365_evk.c
+++ b/board/mediatek/mt8365_evk/mt8365_evk.c
@@ -6,11 +6,6 @@
 
 #include <asm/armv8/mmu.h>
 
-int board_init(void)
-{
-	return 0;
-}
-
 static struct mm_region mt8365_evk_mem_map[] = {
 	{
 		/* DDR */
diff --git a/board/mediatek/mt8516/mt8516_pumpkin.c b/board/mediatek/mt8516/mt8516_pumpkin.c
index 930bfec34836..c383d1943574 100644
--- a/board/mediatek/mt8516/mt8516_pumpkin.c
+++ b/board/mediatek/mt8516/mt8516_pumpkin.c
@@ -6,11 +6,6 @@
 #include <dm.h>
 #include <net.h>
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	struct udevice *dev;
diff --git a/board/nuvoton/arbel_evb/arbel_evb.c b/board/nuvoton/arbel_evb/arbel_evb.c
index 699e5ca54a73..16dbaa96e8ce 100644
--- a/board/nuvoton/arbel_evb/arbel_evb.c
+++ b/board/nuvoton/arbel_evb/arbel_evb.c
@@ -22,11 +22,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-int board_init(void)
-{
-	return 0;
-}
-
 phys_size_t get_effective_memsize(void)
 {
 	/* Use bank0 only */
diff --git a/board/nuvoton/poleg_evb/poleg_evb.c b/board/nuvoton/poleg_evb/poleg_evb.c
index 2faa34954eb0..0a3c052a019f 100644
--- a/board/nuvoton/poleg_evb/poleg_evb.c
+++ b/board/nuvoton/poleg_evb/poleg_evb.c
@@ -14,11 +14,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-int board_init(void)
-{
-	return 0;
-}
-
 int dram_init(void)
 {
 	struct npcm_gcr *gcr = (struct npcm_gcr *)NPCM_GCR_BA;
diff --git a/board/openpiton/riscv64/openpiton-riscv64.c b/board/openpiton/riscv64/openpiton-riscv64.c
index 4c957e889921..62007f2f81d3 100644
--- a/board/openpiton/riscv64/openpiton-riscv64.c
+++ b/board/openpiton/riscv64/openpiton-riscv64.c
@@ -25,8 +25,3 @@ void board_boot_order(u32 *spl_boot_list)
 		spl_boot_list[i] = boot_devices[i];
 }
 #endif
-
-int board_init(void)
-{
-		return 0;
-}
diff --git a/board/phytec/phycore_am62ax/phycore-am62ax.c b/board/phytec/phycore_am62ax/phycore-am62ax.c
index 14b8959c07a7..3e1c4102cc18 100644
--- a/board/phytec/phycore_am62ax/phycore-am62ax.c
+++ b/board/phytec/phycore_am62ax/phycore-am62ax.c
@@ -11,11 +11,6 @@
 
 #include "../common/am6_som_detection.h"
 
-int board_init(void)
-{
-	return 0;
-}
-
 int dram_init(void)
 {
 	return fdtdec_setup_mem_size_base();
diff --git a/board/phytec/phycore_am62x/phycore-am62x.c b/board/phytec/phycore_am62x/phycore-am62x.c
index b199fdaa59bf..51da864aa809 100644
--- a/board/phytec/phycore_am62x/phycore-am62x.c
+++ b/board/phytec/phycore_am62x/phycore-am62x.c
@@ -19,11 +19,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-int board_init(void)
-{
-	return 0;
-}
-
 static u8 phytec_get_am62_ddr_size_default(void)
 {
 	int ret;
diff --git a/board/phytec/phycore_am64x/phycore-am64x.c b/board/phytec/phycore_am64x/phycore-am64x.c
index f14c87f5c727..33c39376ceb9 100644
--- a/board/phytec/phycore_am64x/phycore-am64x.c
+++ b/board/phytec/phycore_am64x/phycore-am64x.c
@@ -19,11 +19,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-int board_init(void)
-{
-	return 0;
-}
-
 static u8 phytec_get_am64_ddr_size_default(void)
 {
 	int ret;
diff --git a/board/phytium/durian/durian.c b/board/phytium/durian/durian.c
index 01e210fcdd15..9fc63febdac9 100644
--- a/board/phytium/durian/durian.c
+++ b/board/phytium/durian/durian.c
@@ -37,11 +37,6 @@ int dram_init_banksize(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 void reset_cpu(void)
 {
 	struct arm_smccc_res res;
diff --git a/board/phytium/pe2201/pe2201.c b/board/phytium/pe2201/pe2201.c
index fbbf6789b505..6824454cdf4f 100644
--- a/board/phytium/pe2201/pe2201.c
+++ b/board/phytium/pe2201/pe2201.c
@@ -50,11 +50,6 @@ int dram_init_banksize(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 void reset_cpu(void)
 {
 	struct arm_smccc_res res;
diff --git a/board/phytium/pomelo/pomelo.c b/board/phytium/pomelo/pomelo.c
index 0ea335e7486b..3984ddc45947 100644
--- a/board/phytium/pomelo/pomelo.c
+++ b/board/phytium/pomelo/pomelo.c
@@ -32,11 +32,6 @@ int dram_init(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 void reset_cpu(void)
 {
 	struct arm_smccc_res res;
diff --git a/board/renesas/r2dplus/r2dplus.c b/board/renesas/r2dplus/r2dplus.c
index 78b8cb4ac348..6ea903f2d62a 100644
--- a/board/renesas/r2dplus/r2dplus.c
+++ b/board/renesas/r2dplus/r2dplus.c
@@ -17,11 +17,6 @@ int checkboard(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	return 0;
diff --git a/board/renesas/rzg2l/rzg2l.c b/board/renesas/rzg2l/rzg2l.c
index 0f6d6e7f514f..509c5dbb156b 100644
--- a/board/renesas/rzg2l/rzg2l.c
+++ b/board/renesas/rzg2l/rzg2l.c
@@ -51,8 +51,3 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 {
 	return 0;
 }
-
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/samsung/e850-96/e850-96.c b/board/samsung/e850-96/e850-96.c
index 3bbd95201b5f..4d4f8d14c6de 100644
--- a/board/samsung/e850-96/e850-96.c
+++ b/board/samsung/e850-96/e850-96.c
@@ -17,11 +17,6 @@ int dram_init_banksize(void)
 	return fdtdec_setup_memory_banksize();
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	int err;
diff --git a/board/sandbox/sandbox.c b/board/sandbox/sandbox.c
index 43f4edc39e9f..0dc23a27dfc9 100644
--- a/board/sandbox/sandbox.c
+++ b/board/sandbox/sandbox.c
@@ -104,11 +104,6 @@ int dram_init(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 int ft_board_setup(void *fdt, struct bd_info *bd)
 {
 	/* Create an arbitrary reservation to allow testing OF_BOARD_SETUP.*/
diff --git a/board/siemens/iot2050/board.c b/board/siemens/iot2050/board.c
index 161210c60a96..c75f4a0d084d 100644
--- a/board/siemens/iot2050/board.c
+++ b/board/siemens/iot2050/board.c
@@ -367,11 +367,6 @@ static void m2_connector_setup(void)
 	m2_overlay_prepare();
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 int dram_init(void)
 {
 	struct udevice *sysinfo;
diff --git a/board/sipeed/maix/maix.c b/board/sipeed/maix/maix.c
index 08077a1f9e13..f76e1ae75a16 100644
--- a/board/sipeed/maix/maix.c
+++ b/board/sipeed/maix/maix.c
@@ -43,8 +43,3 @@ int board_early_init_f(void)
 {
 	return sram_init();
 }
-
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/sophgo/licheerv_nano/board.c b/board/sophgo/licheerv_nano/board.c
index eaa47be17396..e6099d35dbfe 100644
--- a/board/sophgo/licheerv_nano/board.c
+++ b/board/sophgo/licheerv_nano/board.c
@@ -3,7 +3,3 @@
  * Copyright (c) 2024, Kongyang Liu <seashell11234455@gmail.com>
  */
 
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/spacemit/bananapi-f3/board.c b/board/spacemit/bananapi-f3/board.c
index 2631cdd49e0e..ea416621544d 100644
--- a/board/spacemit/bananapi-f3/board.c
+++ b/board/spacemit/bananapi-f3/board.c
@@ -3,7 +3,3 @@
  * Copyright (c) 2024, Kongyang Liu <seashell11234455@gmail.com>
  */
 
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/st/stih410-b2260/board.c b/board/st/stih410-b2260/board.c
index 8ad593cccdde..f5174720434a 100644
--- a/board/st/stih410-b2260/board.c
+++ b/board/st/stih410-b2260/board.c
@@ -32,11 +32,6 @@ void enable_caches(void)
 }
 #endif
 
-int board_init(void)
-{
-	return 0;
-}
-
 #ifdef CONFIG_USB_DWC3
 int g_dnl_board_usb_cable_connected(void)
 {
diff --git a/board/st/stm32f429-discovery/stm32f429-discovery.c b/board/st/stm32f429-discovery/stm32f429-discovery.c
index 22d751b44d3d..4b0defda1ecb 100644
--- a/board/st/stm32f429-discovery/stm32f429-discovery.c
+++ b/board/st/stm32f429-discovery/stm32f429-discovery.c
@@ -45,11 +45,6 @@ int dram_init_banksize(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 #ifdef CONFIG_MISC_INIT_R
 int misc_init_r(void)
 {
diff --git a/board/st/stm32f429-evaluation/stm32f429-evaluation.c b/board/st/stm32f429-evaluation/stm32f429-evaluation.c
index db59ebb838e7..88c825334a8d 100644
--- a/board/st/stm32f429-evaluation/stm32f429-evaluation.c
+++ b/board/st/stm32f429-evaluation/stm32f429-evaluation.c
@@ -39,11 +39,6 @@ int dram_init_banksize(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 #ifdef CONFIG_MISC_INIT_R
 int misc_init_r(void)
 {
diff --git a/board/st/stm32f469-discovery/stm32f469-discovery.c b/board/st/stm32f469-discovery/stm32f469-discovery.c
index 134d207d95d8..7aab7f71d0cf 100644
--- a/board/st/stm32f469-discovery/stm32f469-discovery.c
+++ b/board/st/stm32f469-discovery/stm32f469-discovery.c
@@ -39,11 +39,6 @@ int dram_init_banksize(void)
 	return 0;
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 #ifdef CONFIG_MISC_INIT_R
 int misc_init_r(void)
 {
diff --git a/board/st/stm32h743-disco/stm32h743-disco.c b/board/st/stm32h743-disco/stm32h743-disco.c
index 35ef9ff9e288..d00f55379c5c 100644
--- a/board/st/stm32h743-disco/stm32h743-disco.c
+++ b/board/st/stm32h743-disco/stm32h743-disco.c
@@ -34,8 +34,3 @@ int dram_init_banksize(void)
 
 	return 0;
 }
-
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/st/stm32h743-eval/stm32h743-eval.c b/board/st/stm32h743-eval/stm32h743-eval.c
index 35ef9ff9e288..d00f55379c5c 100644
--- a/board/st/stm32h743-eval/stm32h743-eval.c
+++ b/board/st/stm32h743-eval/stm32h743-eval.c
@@ -34,8 +34,3 @@ int dram_init_banksize(void)
 
 	return 0;
 }
-
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/st/stm32h747-disco/stm32h747-disco.c b/board/st/stm32h747-disco/stm32h747-disco.c
index be0884bdeb4d..645685a64f19 100644
--- a/board/st/stm32h747-disco/stm32h747-disco.c
+++ b/board/st/stm32h747-disco/stm32h747-disco.c
@@ -35,8 +35,3 @@ int dram_init_banksize(void)
 
 	return 0;
 }
-
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/st/stm32h750-art-pi/stm32h750-art-pi.c b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
index 75aa4d139fb4..31c85c6816e9 100644
--- a/board/st/stm32h750-art-pi/stm32h750-art-pi.c
+++ b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
@@ -44,8 +44,3 @@ int board_late_init(void)
 {
 	return 0;
 }
-
-int board_init(void)
-{
-	return 0;
-}
diff --git a/board/ti/am62ax/evm.c b/board/ti/am62ax/evm.c
index 3351544c5b37..a445f9832555 100644
--- a/board/ti/am62ax/evm.c
+++ b/board/ti/am62ax/evm.c
@@ -16,11 +16,6 @@
 
 #include "../common/fdt_ops.h"
 
-int board_init(void)
-{
-	return 0;
-}
-
 #if defined(CONFIG_XPL_BUILD)
 void spl_perform_fixups(struct spl_image_info *spl_image)
 {
diff --git a/board/ti/am62px/evm.c b/board/ti/am62px/evm.c
index 379d1a5b3164..2e85363cf5fe 100644
--- a/board/ti/am62px/evm.c
+++ b/board/ti/am62px/evm.c
@@ -41,11 +41,6 @@ struct efi_capsule_update_info update_info = {
 	.images = fw_images,
 };
 
-int board_init(void)
-{
-	return 0;
-}
-
 #if defined(CONFIG_XPL_BUILD)
 void spl_perform_fixups(struct spl_image_info *spl_image)
 {
diff --git a/board/ti/am62x/evm.c b/board/ti/am62x/evm.c
index 3051a0a27a13..d7b07a0d34dd 100644
--- a/board/ti/am62x/evm.c
+++ b/board/ti/am62x/evm.c
@@ -74,11 +74,6 @@ struct efi_capsule_update_info update_info = {
 	.images = fw_images,
 };
 
-int board_init(void)
-{
-	return 0;
-}
-
 #ifdef CONFIG_BOARD_LATE_INIT
 int board_late_init(void)
 {
diff --git a/board/ti/am64x/evm.c b/board/ti/am64x/evm.c
index 35fd30dbcebe..8e89b3b15df2 100644
--- a/board/ti/am64x/evm.c
+++ b/board/ti/am64x/evm.c
@@ -54,11 +54,6 @@ struct efi_capsule_update_info update_info = {
 	.images = fw_images,
 };
 
-int board_init(void)
-{
-	return 0;
-}
-
 #if defined(CONFIG_SPL_LOAD_FIT)
 int board_fit_config_name_match(const char *name)
 {
diff --git a/board/ti/am65x/evm.c b/board/ti/am65x/evm.c
index 6658794a1375..5c45a33eac90 100644
--- a/board/ti/am65x/evm.c
+++ b/board/ti/am65x/evm.c
@@ -45,11 +45,6 @@ enum {
 
 DECLARE_GLOBAL_DATA_PTR;
 
-int board_init(void)
-{
-	return 0;
-}
-
 phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 #ifdef CONFIG_PHYS_64BIT
diff --git a/board/ti/j721e/evm.c b/board/ti/j721e/evm.c
index b1ed29af0018..1527eaf1e166 100644
--- a/board/ti/j721e/evm.c
+++ b/board/ti/j721e/evm.c
@@ -66,11 +66,6 @@ struct efi_capsule_update_info update_info = {
 	.images = fw_images,
 };
 
-int board_init(void)
-{
-	return 0;
-}
-
 phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 #ifdef CONFIG_PHYS_64BIT
diff --git a/board/ti/j721s2/evm.c b/board/ti/j721s2/evm.c
index 8c8f8e2a265b..5d3b84607d82 100644
--- a/board/ti/j721s2/evm.c
+++ b/board/ti/j721s2/evm.c
@@ -28,11 +28,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-int board_init(void)
-{
-	return 0;
-}
-
 phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
 {
 #ifdef CONFIG_PHYS_64BIT
diff --git a/board/ti/j722s/evm.c b/board/ti/j722s/evm.c
index f085ecfd37e9..d2b94913c126 100644
--- a/board/ti/j722s/evm.c
+++ b/board/ti/j722s/evm.c
@@ -15,11 +15,6 @@
 #include <asm/arch/k3-ddr.h>
 #include "../common/fdt_ops.h"
 
-int board_init(void)
-{
-	return 0;
-}
-
 #if defined(CONFIG_XPL_BUILD)
 void spl_perform_fixups(struct spl_image_info *spl_image)
 {
diff --git a/board/ti/j784s4/evm.c b/board/ti/j784s4/evm.c
index c8d01bf0ca89..6335676081ac 100644
--- a/board/ti/j784s4/evm.c
+++ b/board/ti/j784s4/evm.c
@@ -41,11 +41,6 @@ struct efi_capsule_update_info update_info = {
 	.images = fw_images,
 };
 
-int board_init(void)
-{
-	return 0;
-}
-
 #if defined(CONFIG_XPL_BUILD)
 void spl_perform_fixups(struct spl_image_info *spl_image)
 {
diff --git a/board/toradex/smarc-imx8mp/smarc-imx8mp.c b/board/toradex/smarc-imx8mp/smarc-imx8mp.c
index bbe371516cc6..915b413b15e9 100644
--- a/board/toradex/smarc-imx8mp/smarc-imx8mp.c
+++ b/board/toradex/smarc-imx8mp/smarc-imx8mp.c
@@ -10,11 +10,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_phys_sdram_size(phys_size_t *size)
 {
 	if (!size)
diff --git a/board/toradex/verdin-am62/verdin-am62.c b/board/toradex/verdin-am62/verdin-am62.c
index eca2cc8bc7f8..cbdd5b1a0b78 100644
--- a/board/toradex/verdin-am62/verdin-am62.c
+++ b/board/toradex/verdin-am62/verdin-am62.c
@@ -22,11 +22,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-int board_init(void)
-{
-	return 0;
-}
-
 int dram_init(void)
 {
 	gd->ram_size = get_ram_size((long *)CFG_SYS_SDRAM_BASE, CFG_SYS_SDRAM_SIZE);
diff --git a/board/toradex/verdin-am62p/verdin-am62p.c b/board/toradex/verdin-am62p/verdin-am62p.c
index 43d1c9312fe3..2e4909fc6800 100644
--- a/board/toradex/verdin-am62p/verdin-am62p.c
+++ b/board/toradex/verdin-am62p/verdin-am62p.c
@@ -55,11 +55,6 @@ static void read_hw_cfg(void)
 	printf("0x%02x\n", hw_cfg);
 }
 
-int board_init(void)
-{
-	return 0;
-}
-
 int dram_init(void)
 {
 	gd->ram_size = get_ram_size((long *)CFG_SYS_SDRAM_BASE, CFG_SYS_SDRAM_SIZE);
diff --git a/board/variscite/imx8mn_var_som/imx8mn_var_som.c b/board/variscite/imx8mn_var_som/imx8mn_var_som.c
index 80c84e642412..14aa93c527b5 100644
--- a/board/variscite/imx8mn_var_som/imx8mn_var_som.c
+++ b/board/variscite/imx8mn_var_som/imx8mn_var_som.c
@@ -44,11 +44,6 @@ struct var_imx8_eeprom_info {
 	u8 partnumber2[5];        /* Part number 2 */
 } __packed;
 
-int board_init(void)
-{
-	return 0;
-}
-
 int board_mmc_get_env_dev(int devno)
 {
 	return devno;
diff --git a/board/xen/xenguest_arm64/xenguest_arm64.c b/board/xen/xenguest_arm64/xenguest_arm64.c
index 216a022aa156..174752f6b079 100644
--- a/board/xen/xenguest_arm64/xenguest_arm64.c
+++ b/board/xen/xenguest_arm64/xenguest_arm64.c
@@ -33,11 +33,6 @@ DECLARE_GLOBAL_DATA_PTR;
 #define GUEST_VIRTIO_MMIO_BASE	0x2000000
 #define GUEST_VIRTIO_MMIO_SIZE	0x100000
 
-int board_init(void)
-{
-	return 0;
-}
-
 /*
  * Use fdt provided by Xen: according to
  * https://www.kernel.org/doc/Documentation/arm64/booting.txt
diff --git a/board/xilinx/mbv/board.c b/board/xilinx/mbv/board.c
index c478f7e04a0c..ed3fe16af7b9 100644
--- a/board/xilinx/mbv/board.c
+++ b/board/xilinx/mbv/board.c
@@ -7,11 +7,6 @@
 
 #include <spl.h>
 
-int board_init(void)
-{
-	return 0;
-}
-
 #ifdef CONFIG_SPL
 u32 spl_boot_device(void)
 {
diff --git a/board/xilinx/zynqmp_r5/board.c b/board/xilinx/zynqmp_r5/board.c
index 0c62b0013c46..c34a7c5ecae0 100644
--- a/board/xilinx/zynqmp_r5/board.c
+++ b/board/xilinx/zynqmp_r5/board.c
@@ -7,11 +7,6 @@
 #include <init.h>
 #include <linux/errno.h>
 
-int board_init(void)
-{
-	return 0;
-}
-
 int dram_init_banksize(void)
 {
 	return fdtdec_setup_memory_banksize();
diff --git a/configs/am62ax_evm_r5_defconfig b/configs/am62ax_evm_r5_defconfig
index 52df6e0ca3f5..64886986c426 100644
--- a/configs/am62ax_evm_r5_defconfig
+++ b/configs/am62ax_evm_r5_defconfig
@@ -27,6 +27,7 @@ CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x3B000
diff --git a/configs/am62px_evm_r5_defconfig b/configs/am62px_evm_r5_defconfig
index 21a381e81137..c9592d7b6c4c 100644
--- a/configs/am62px_evm_r5_defconfig
+++ b/configs/am62px_evm_r5_defconfig
@@ -32,6 +32,7 @@ CONFIG_SPL_SPI=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x3B000
diff --git a/configs/am62x_a53_usbdfu.config b/configs/am62x_a53_usbdfu.config
index 373b1d0ed64e..04f360668b6c 100644
--- a/configs/am62x_a53_usbdfu.config
+++ b/configs/am62x_a53_usbdfu.config
@@ -1,3 +1,4 @@
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_RAM_SUPPORT=y
 CONFIG_SPL_RAM_DEVICE=y
diff --git a/configs/am62x_beagleplay_r5_defconfig b/configs/am62x_beagleplay_r5_defconfig
index 099a4828a7f4..ce503000e4cf 100644
--- a/configs/am62x_beagleplay_r5_defconfig
+++ b/configs/am62x_beagleplay_r5_defconfig
@@ -31,6 +31,7 @@ CONFIG_SPL_SPI=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x3B000
diff --git a/configs/am62x_evm_r5_defconfig b/configs/am62x_evm_r5_defconfig
index ba6396c9dfcd..18ffc991b25e 100644
--- a/configs/am62x_evm_r5_defconfig
+++ b/configs/am62x_evm_r5_defconfig
@@ -34,6 +34,7 @@ CONFIG_SPL_SPI=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x3B000
diff --git a/configs/am64x_evm_a53_defconfig b/configs/am64x_evm_a53_defconfig
index fd2b28a1c6ea..ae261f2fa013 100644
--- a/configs/am64x_evm_a53_defconfig
+++ b/configs/am64x_evm_a53_defconfig
@@ -37,6 +37,7 @@ CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x81000000
 CONFIG_BOOTSTD_FULL=y
 CONFIG_BOOTCOMMAND="run envboot; bootflow scan -lb"
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x180000
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/am64x_evm_r5_defconfig b/configs/am64x_evm_r5_defconfig
index fdf5d7803bbc..491e0dd102e3 100644
--- a/configs/am64x_evm_r5_defconfig
+++ b/configs/am64x_evm_r5_defconfig
@@ -33,6 +33,7 @@ CONFIG_SPL_SPI=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x180000
diff --git a/configs/am65x_evm_a53_defconfig b/configs/am65x_evm_a53_defconfig
index 438ec8a1c567..bf44c19befed 100644
--- a/configs/am65x_evm_a53_defconfig
+++ b/configs/am65x_evm_a53_defconfig
@@ -39,6 +39,7 @@ CONFIG_BOOTSTD_BOOTCOMMAND=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_LOGLEVEL=7
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x58000
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_SYS_MALLOC=y
diff --git a/configs/am65x_evm_r5_defconfig b/configs/am65x_evm_r5_defconfig
index 7d3eb6f8c931..6733dcfdd855 100644
--- a/configs/am65x_evm_r5_defconfig
+++ b/configs/am65x_evm_r5_defconfig
@@ -33,6 +33,7 @@ CONFIG_SPL_SPI=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x58000
diff --git a/configs/am65x_evm_r5_usbmsc_defconfig b/configs/am65x_evm_r5_usbmsc_defconfig
index 63ba94ff90e6..37b5c6a43e73 100644
--- a/configs/am65x_evm_r5_usbmsc_defconfig
+++ b/configs/am65x_evm_r5_usbmsc_defconfig
@@ -29,6 +29,7 @@ CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x58000
diff --git a/configs/am67a_beagley_ai_a53_defconfig b/configs/am67a_beagley_ai_a53_defconfig
index 013529d26dac..4693f3bc9b3d 100644
--- a/configs/am67a_beagley_ai_a53_defconfig
+++ b/configs/am67a_beagley_ai_a53_defconfig
@@ -32,6 +32,7 @@ CONFIG_AUTOBOOT_PROMPT="Press SPACE to abort autoboot in %d seconds\n"
 CONFIG_AUTOBOOT_DELAY_STR="d"
 CONFIG_AUTOBOOT_STOP_STR=" "
 CONFIG_BOOTCOMMAND="run set_led_state_start_load; run envboot; bootflow scan -lb; run set_led_state_fail_load"
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x58000
 CONFIG_SPL_PAD_TO=0x0
diff --git a/configs/am67a_beagley_ai_r5_defconfig b/configs/am67a_beagley_ai_r5_defconfig
index b0a95da1086c..00c6ba6e2b57 100644
--- a/configs/am67a_beagley_ai_r5_defconfig
+++ b/configs/am67a_beagley_ai_r5_defconfig
@@ -30,6 +30,7 @@ CONFIG_SPL_SPI=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x6ce00
diff --git a/configs/arbel_evb_defconfig b/configs/arbel_evb_defconfig
index 34c4e9a3f749..8572ad204d82 100644
--- a/configs/arbel_evb_defconfig
+++ b/configs/arbel_evb_defconfig
@@ -25,6 +25,7 @@ CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="run common_bootargs; run romboot"
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_SYS_PROMPT="U-Boot>"
 CONFIG_SYS_MAXARGS=32
diff --git a/configs/bananapi-f3_defconfig b/configs/bananapi-f3_defconfig
index a8b4cc675ab0..a726ce84775d 100644
--- a/configs/bananapi-f3_defconfig
+++ b/configs/bananapi-f3_defconfig
@@ -14,6 +14,7 @@ CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=276
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_ENV_OVERWRITE=y
 CONFIG_PINCTRL=y
diff --git a/configs/bcm7260_defconfig b/configs/bcm7260_defconfig
index 040ef695fec4..ca09351384d6 100644
--- a/configs/bcm7260_defconfig
+++ b/configs/bcm7260_defconfig
@@ -20,6 +20,7 @@ CONFIG_USE_PREBOOT=y
 CONFIG_PREBOOT="fdt addr ${fdtcontroladdr};fdt move ${fdtcontroladdr} ${fdtsaveaddr};fdt addr ${fdtsaveaddr};"
 CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=536
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_HUSH_PARSER=y
 CONFIG_SYS_PROMPT="U-Boot>"
diff --git a/configs/bcm7445_defconfig b/configs/bcm7445_defconfig
index 1eafadf25357..185d6e24bd41 100644
--- a/configs/bcm7445_defconfig
+++ b/configs/bcm7445_defconfig
@@ -21,6 +21,7 @@ CONFIG_USE_PREBOOT=y
 CONFIG_PREBOOT="fdt addr ${fdtcontroladdr};fdt move ${fdtcontroladdr} ${fdtsaveaddr};fdt addr ${fdtsaveaddr};"
 CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=536
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_HUSH_PARSER=y
 CONFIG_SYS_PROMPT="U-Boot>"
diff --git a/configs/bcm947622_defconfig b/configs/bcm947622_defconfig
index 566f9f2920f2..1481e03f9806 100644
--- a/configs/bcm947622_defconfig
+++ b/configs/bcm947622_defconfig
@@ -15,6 +15,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM47622"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm94908_defconfig b/configs/bcm94908_defconfig
index a19b112f86a9..90eaacd88781 100644
--- a/configs/bcm94908_defconfig
+++ b/configs/bcm94908_defconfig
@@ -15,6 +15,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM4908"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm94912_defconfig b/configs/bcm94912_defconfig
index 46bbfb67980c..859bb78c2488 100644
--- a/configs/bcm94912_defconfig
+++ b/configs/bcm94912_defconfig
@@ -15,6 +15,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM4912"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm963138_defconfig b/configs/bcm963138_defconfig
index aa582b79bc87..f59e4e245eaf 100644
--- a/configs/bcm963138_defconfig
+++ b/configs/bcm963138_defconfig
@@ -15,6 +15,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM63138"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm963146_defconfig b/configs/bcm963146_defconfig
index 239a8a10fa5d..5deea27ee34c 100644
--- a/configs/bcm963146_defconfig
+++ b/configs/bcm963146_defconfig
@@ -15,6 +15,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM63146"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm963148_defconfig b/configs/bcm963148_defconfig
index 48bc620e1813..8b8a46c321c9 100644
--- a/configs/bcm963148_defconfig
+++ b/configs/bcm963148_defconfig
@@ -16,6 +16,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM63148"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm963158_defconfig b/configs/bcm963158_defconfig
index a6cfea6cd795..df78621c1e74 100644
--- a/configs/bcm963158_defconfig
+++ b/configs/bcm963158_defconfig
@@ -15,6 +15,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM63158"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm963178_defconfig b/configs/bcm963178_defconfig
index 95c9c8e396ee..2015b71f36ec 100644
--- a/configs/bcm963178_defconfig
+++ b/configs/bcm963178_defconfig
@@ -16,6 +16,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM63178"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm96756_defconfig b/configs/bcm96756_defconfig
index bfd309c25f51..0bd4ccb377ab 100644
--- a/configs/bcm96756_defconfig
+++ b/configs/bcm96756_defconfig
@@ -16,6 +16,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM6756"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm96813_defconfig b/configs/bcm96813_defconfig
index 7f165231648c..a3909c674745 100644
--- a/configs/bcm96813_defconfig
+++ b/configs/bcm96813_defconfig
@@ -15,6 +15,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM6813"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm96846_defconfig b/configs/bcm96846_defconfig
index 8bc6ac18be93..d26e4db2a96c 100644
--- a/configs/bcm96846_defconfig
+++ b/configs/bcm96846_defconfig
@@ -16,6 +16,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM6846"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_BOOTZ=y
 CONFIG_CMD_NAND=y
diff --git a/configs/bcm96855_defconfig b/configs/bcm96855_defconfig
index 342be0a0e17c..de113ef4746a 100644
--- a/configs/bcm96855_defconfig
+++ b/configs/bcm96855_defconfig
@@ -16,6 +16,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM6855"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm96856_defconfig b/configs/bcm96856_defconfig
index 5f22186966fa..710440f9c793 100644
--- a/configs/bcm96856_defconfig
+++ b/configs/bcm96856_defconfig
@@ -15,6 +15,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM6856"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm96858_defconfig b/configs/bcm96858_defconfig
index 682cb14e898c..62e767fc8309 100644
--- a/configs/bcm96858_defconfig
+++ b/configs/bcm96858_defconfig
@@ -15,6 +15,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM6858"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcm96878_defconfig b/configs/bcm96878_defconfig
index ad65187c30ce..9689c6a9a158 100644
--- a/configs/bcm96878_defconfig
+++ b/configs/bcm96878_defconfig
@@ -16,6 +16,7 @@ CONFIG_IDENT_STRING=" Broadcom BCM6878"
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_NAND=y
 CONFIG_CMD_CACHE=y
diff --git a/configs/bcmns_defconfig b/configs/bcmns_defconfig
index c53c6fffbc40..21e7c684a473 100644
--- a/configs/bcmns_defconfig
+++ b/configs/bcmns_defconfig
@@ -20,6 +20,7 @@ CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="run bootcmd_dlink_dir8xxl"
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_SYS_PROMPT="northstar> "
 CONFIG_CMD_BOOTZ=y
diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
index 80163580f857..527a679b785d 100644
--- a/configs/corstone1000_defconfig
+++ b/configs/corstone1000_defconfig
@@ -26,6 +26,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_LOGLEVEL=7
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SYS_PROMPT="corstone1000# "
 # CONFIG_CMD_CONSOLE is not set
diff --git a/configs/durian_defconfig b/configs/durian_defconfig
index 336c7a5269e0..448332d4667f 100644
--- a/configs/durian_defconfig
+++ b/configs/durian_defconfig
@@ -22,6 +22,7 @@ CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=280
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="durian#"
 # CONFIG_CMD_LZMADEC is not set
 # CONFIG_CMD_UNZIP is not set
diff --git a/configs/e850-96_defconfig b/configs/e850-96_defconfig
index f0e9ff7c4470..4208905e77aa 100644
--- a/configs/e850-96_defconfig
+++ b/configs/e850-96_defconfig
@@ -19,6 +19,7 @@ CONFIG_ANDROID_BOOT_IMAGE=y
 CONFIG_BOOTSTD_FULL=y
 CONFIG_DEFAULT_FDT_FILE="exynos850-e850-96.dtb"
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_CMD_BOOTEFI_SELFTEST=y
 CONFIG_CMD_ABOOTIMG=y
diff --git a/configs/hikey_defconfig b/configs/hikey_defconfig
index 59c2101110ea..476bfc3af10e 100644
--- a/configs/hikey_defconfig
+++ b/configs/hikey_defconfig
@@ -21,6 +21,7 @@ CONFIG_SYS_PBSIZE=532
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_BOARD_EARLY_INIT_F=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_MISC_INIT_R=y
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_MMC=y
diff --git a/configs/imx8m_data_modul.config b/configs/imx8m_data_modul.config
index 07390037c460..4634a0972f09 100644
--- a/configs/imx8m_data_modul.config
+++ b/configs/imx8m_data_modul.config
@@ -11,6 +11,7 @@
 CONFIG_ARCH_IMX8M=y
 CONFIG_ARCH_MISC_INIT=y
 CONFIG_ARM=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_BOOTCOMMAND="run dmo_update_env ; load ${devtype} ${devnum}:${devpart} ${loadaddr} boot/fitImage && source ${loadaddr}:bootscr-boot.cmd ; reset"
 CONFIG_BOOTCOUNT_ALTBOOTCMD="run bootcmd"
diff --git a/configs/imx8mm_beacon_defconfig b/configs/imx8mm_beacon_defconfig
index 06cc4bb7dded..7c520f6e4b52 100644
--- a/configs/imx8mm_beacon_defconfig
+++ b/configs/imx8mm_beacon_defconfig
@@ -34,6 +34,7 @@ CONFIG_BOOTCOMMAND="mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript
 CONFIG_DEFAULT_FDT_FILE="imx8mm-beacon-kit.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2074
+# CONFIG_BOARD_INIT is not set
 # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
 CONFIG_SPL_HAVE_INIT_STACK=y
 CONFIG_SPL_SYS_MALLOC=y
diff --git a/configs/imx8mm_beacon_fspi_defconfig b/configs/imx8mm_beacon_fspi_defconfig
index 5e60c9d3a086..0cefcadff6a0 100644
--- a/configs/imx8mm_beacon_fspi_defconfig
+++ b/configs/imx8mm_beacon_fspi_defconfig
@@ -33,6 +33,7 @@ CONFIG_BOOTCOMMAND="mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript
 CONFIG_DEFAULT_FDT_FILE="imx8mm-beacon-kit.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2074
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x25000
 CONFIG_SPL_PAD_TO=0x0
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/imx8mn_beacon_2g_defconfig b/configs/imx8mn_beacon_2g_defconfig
index b71cdbb2e4e9..c757a2180c0a 100644
--- a/configs/imx8mn_beacon_2g_defconfig
+++ b/configs/imx8mn_beacon_2g_defconfig
@@ -40,6 +40,7 @@ CONFIG_BOOTCOMMAND="mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript
 CONFIG_DEFAULT_FDT_FILE="imx8mn-beacon-kit.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2074
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x25000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_BOOTROM_SUPPORT=y
diff --git a/configs/imx8mn_beacon_defconfig b/configs/imx8mn_beacon_defconfig
index bb483653db27..ddaea0c68bdd 100644
--- a/configs/imx8mn_beacon_defconfig
+++ b/configs/imx8mn_beacon_defconfig
@@ -40,6 +40,7 @@ CONFIG_BOOTCOMMAND="mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript
 CONFIG_DEFAULT_FDT_FILE="imx8mn-beacon-kit.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2074
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x25000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_BOOTROM_SUPPORT=y
diff --git a/configs/imx8mn_beacon_fspi_defconfig b/configs/imx8mn_beacon_fspi_defconfig
index f163871bfaab..4a49355195a6 100644
--- a/configs/imx8mn_beacon_fspi_defconfig
+++ b/configs/imx8mn_beacon_fspi_defconfig
@@ -39,6 +39,7 @@ CONFIG_BOOTCOMMAND="mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript
 CONFIG_DEFAULT_FDT_FILE="imx8mn-beacon-kit.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2074
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x25000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_BOOTROM_SUPPORT=y
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index c83f6a99a7e2..dafef23650a8 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -31,7 +31,7 @@ CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="freescale/imx8mn-bsh-smm-s2.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2067
-CONFIG_ARCH_MISC_INIT=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x25000
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/imx8mn_bsh_smm_s2pro_defconfig b/configs/imx8mn_bsh_smm_s2pro_defconfig
index 58550c6c332a..ee12de0deeab 100644
--- a/configs/imx8mn_bsh_smm_s2pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2pro_defconfig
@@ -32,7 +32,7 @@ CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="freescale/imx8mn-bsh-smm-s2pro.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2067
-CONFIG_ARCH_MISC_INIT=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x25000
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/imx8mn_var_som_defconfig b/configs/imx8mn_var_som_defconfig
index 875ddcaaaa4c..b9f3b9b8999c 100644
--- a/configs/imx8mn_var_som_defconfig
+++ b/configs/imx8mn_var_som_defconfig
@@ -36,7 +36,7 @@ CONFIG_DEFAULT_FDT_FILE="freescale/imx8mn-var-som-symphony.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2067
 CONFIG_BOARD_TYPES=y
-CONFIG_ARCH_MISC_INIT=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x25000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_BOOTROM_SUPPORT=y
diff --git a/configs/imx8mp_dhsom.config b/configs/imx8mp_dhsom.config
index 226c58c0277d..406529346c57 100644
--- a/configs/imx8mp_dhsom.config
+++ b/configs/imx8mp_dhsom.config
@@ -3,6 +3,7 @@
 CONFIG_TARGET_IMX8MP_DH_DHCOM_PDK2=y
 # CONFIG_INPUT is not set
 CONFIG_ARCH_MISC_INIT=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_BOOTCOMMAND="run dh_update_env distro_bootcmd ; reset"
 CONFIG_NR_DRAM_BANKS=2
diff --git a/configs/imx8mp_evk_defconfig b/configs/imx8mp_evk_defconfig
index 46039fd0c038..0ad1acb94b6d 100644
--- a/configs/imx8mp_evk_defconfig
+++ b/configs/imx8mp_evk_defconfig
@@ -36,6 +36,7 @@ CONFIG_BOOTCOMMAND="bootflow scan -lb; run bsp_bootcmd"
 CONFIG_DEFAULT_FDT_FILE="imx8mp-evk.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2074
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x26000
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/imx8mp_navqp_defconfig b/configs/imx8mp_navqp_defconfig
index 552665d27caf..216831b0ede7 100644
--- a/configs/imx8mp_navqp_defconfig
+++ b/configs/imx8mp_navqp_defconfig
@@ -31,6 +31,7 @@ CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="imx8mp-navqp.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2074
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x26000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_BOOTROM_SUPPORT=y
diff --git a/configs/imx91_11x11_evk_defconfig b/configs/imx91_11x11_evk_defconfig
index b92754074a04..809885c08730 100644
--- a/configs/imx91_11x11_evk_defconfig
+++ b/configs/imx91_11x11_evk_defconfig
@@ -35,7 +35,7 @@ CONFIG_BOOTCOMMAND="bootflow scan -lb; run bsp_bootcmd"
 CONFIG_DEFAULT_FDT_FILE="imx91-11x11-evk.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2074
-CONFIG_ARCH_MISC_INIT=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x26000
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/imx91_11x11_evk_inline_ecc_defconfig b/configs/imx91_11x11_evk_inline_ecc_defconfig
index 8a5222b6540f..e7fa6b2f730d 100644
--- a/configs/imx91_11x11_evk_inline_ecc_defconfig
+++ b/configs/imx91_11x11_evk_inline_ecc_defconfig
@@ -35,7 +35,7 @@ CONFIG_BOOTCOMMAND="bootflow scan -lb; run bsp_bootcmd"
 CONFIG_DEFAULT_FDT_FILE="imx91-11x11-evk.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2074
-CONFIG_ARCH_MISC_INIT=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x26000
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/imx93_9x9_qsb_defconfig b/configs/imx93_9x9_qsb_defconfig
index 99c349a9295a..be250abb0b1d 100644
--- a/configs/imx93_9x9_qsb_defconfig
+++ b/configs/imx93_9x9_qsb_defconfig
@@ -32,6 +32,7 @@ CONFIG_BOOTCOMMAND="bootflow scan -lb; run bsp_bootcmd"
 CONFIG_DEFAULT_FDT_FILE="imx93-9x9-qsb.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2074
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x26000
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/imx93_9x9_qsb_inline_ecc_defconfig b/configs/imx93_9x9_qsb_inline_ecc_defconfig
index 0966f166ec66..3cb9ee3daf3f 100644
--- a/configs/imx93_9x9_qsb_inline_ecc_defconfig
+++ b/configs/imx93_9x9_qsb_inline_ecc_defconfig
@@ -32,6 +32,7 @@ CONFIG_BOOTCOMMAND="bootflow scan -lb; run bsp_bootcmd"
 CONFIG_DEFAULT_FDT_FILE="imx93-9x9-qsb.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2074
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x26000
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/imx95_19x19_evk_defconfig b/configs/imx95_19x19_evk_defconfig
index 814570ee2ae7..73818a826273 100644
--- a/configs/imx95_19x19_evk_defconfig
+++ b/configs/imx95_19x19_evk_defconfig
@@ -38,8 +38,8 @@ CONFIG_BOOTCOMMAND="bootflow scan -l; run bsp_bootcmd"
 CONFIG_DEFAULT_FDT_FILE="imx95-19x19-evk.dtb"
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=2074
-CONFIG_ARCH_MISC_INIT=y
 CONFIG_BOARD_EARLY_INIT_F=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_PCI_INIT_R=y
 CONFIG_SPL_MAX_SIZE=0x20000
diff --git a/configs/iot2050_defconfig b/configs/iot2050_defconfig
index a88e697d9fab..077992b5faba 100644
--- a/configs/iot2050_defconfig
+++ b/configs/iot2050_defconfig
@@ -46,6 +46,7 @@ CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOOTCOMMAND="run start_watchdog; run distro_bootcmd"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x58000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
diff --git a/configs/j7200_evm_a72_defconfig b/configs/j7200_evm_a72_defconfig
index 3987bab56795..36274804881c 100644
--- a/configs/j7200_evm_a72_defconfig
+++ b/configs/j7200_evm_a72_defconfig
@@ -39,6 +39,7 @@ CONFIG_OF_BOARD_SETUP=y
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOOTCOMMAND="run envboot; bootflow scan -lb"
 CONFIG_LOGLEVEL=7
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0xc0000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
diff --git a/configs/j721e_beagleboneai64_a72_defconfig b/configs/j721e_beagleboneai64_a72_defconfig
index 00ed3d91242a..e7f708a60c5e 100644
--- a/configs/j721e_beagleboneai64_a72_defconfig
+++ b/configs/j721e_beagleboneai64_a72_defconfig
@@ -37,6 +37,7 @@ CONFIG_AUTOBOOT_STOP_STR=" "
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOOTCOMMAND="run set_led_state_start_load; run envboot; bootflow scan -lb;run set_led_state_fail_load"
 CONFIG_LOGLEVEL=7
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0xc0000
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
diff --git a/configs/j721e_beagleboneai64_r5_defconfig b/configs/j721e_beagleboneai64_r5_defconfig
index 99e96c90ef9f..50a9d95d7bf2 100644
--- a/configs/j721e_beagleboneai64_r5_defconfig
+++ b/configs/j721e_beagleboneai64_r5_defconfig
@@ -32,6 +32,7 @@ CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0xf59f0
diff --git a/configs/j721e_evm_a72_defconfig b/configs/j721e_evm_a72_defconfig
index 02e3ac343d95..42e1dd21d0b4 100644
--- a/configs/j721e_evm_a72_defconfig
+++ b/configs/j721e_evm_a72_defconfig
@@ -36,6 +36,7 @@ CONFIG_OF_BOARD_SETUP=y
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOOTCOMMAND="run envboot; bootflow scan -lb"
 CONFIG_LOGLEVEL=7
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0xc0000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
diff --git a/configs/j721e_evm_r5_defconfig b/configs/j721e_evm_r5_defconfig
index 3a54a4c97d1b..ceb2e273b545 100644
--- a/configs/j721e_evm_r5_defconfig
+++ b/configs/j721e_evm_r5_defconfig
@@ -37,6 +37,7 @@ CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0xf59f0
diff --git a/configs/j721s2_evm_a72_defconfig b/configs/j721s2_evm_a72_defconfig
index ac584f50b948..8ea9decf15bd 100644
--- a/configs/j721s2_evm_a72_defconfig
+++ b/configs/j721s2_evm_a72_defconfig
@@ -36,6 +36,7 @@ CONFIG_BOOTSTD_FULL=y
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOOTCOMMAND="run envboot; bootflow scan -lb"
 CONFIG_LOGLEVEL=7
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0xc0000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
diff --git a/configs/j721s2_evm_r5_defconfig b/configs/j721s2_evm_r5_defconfig
index f4c0862d0a80..aaf8fd328790 100644
--- a/configs/j721s2_evm_r5_defconfig
+++ b/configs/j721s2_evm_r5_defconfig
@@ -36,6 +36,7 @@ CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0xc0000
diff --git a/configs/j722s_evm_a53_defconfig b/configs/j722s_evm_a53_defconfig
index 19f4a3b0e926..83ac99c922ad 100644
--- a/configs/j722s_evm_a53_defconfig
+++ b/configs/j722s_evm_a53_defconfig
@@ -32,6 +32,7 @@ CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x81000000
 CONFIG_BOOTSTD_FULL=y
 CONFIG_BOOTCOMMAND="run envboot; bootflow scan -lb"
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x58000
 CONFIG_SPL_PAD_TO=0x0
diff --git a/configs/j722s_evm_r5_defconfig b/configs/j722s_evm_r5_defconfig
index f4562bd0d682..8e2741c8d426 100644
--- a/configs/j722s_evm_r5_defconfig
+++ b/configs/j722s_evm_r5_defconfig
@@ -33,6 +33,7 @@ CONFIG_SPL_SPI=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x6ce00
diff --git a/configs/j784s4_evm_a72_defconfig b/configs/j784s4_evm_a72_defconfig
index 6b1306cf7af9..67aa18a16da9 100644
--- a/configs/j784s4_evm_a72_defconfig
+++ b/configs/j784s4_evm_a72_defconfig
@@ -34,6 +34,7 @@ CONFIG_SPL_LOAD_FIT_ADDRESS=0x81000000
 CONFIG_BOOTSTD_FULL=y
 CONFIG_BOOTCOMMAND="run envboot; bootflow scan -lb"
 CONFIG_LOGLEVEL=7
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0xc0000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
diff --git a/configs/j784s4_evm_r5_defconfig b/configs/j784s4_evm_r5_defconfig
index 9e4170028f4f..cc340a2fe762 100644
--- a/configs/j784s4_evm_r5_defconfig
+++ b/configs/j784s4_evm_r5_defconfig
@@ -35,6 +35,7 @@ CONFIG_SPL_SPI=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 CONFIG_USE_BOOTCOMMAND=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0xc0000
diff --git a/configs/k230_canmv_defconfig b/configs/k230_canmv_defconfig
index 47fa1add2a9c..a43412f0290b 100644
--- a/configs/k230_canmv_defconfig
+++ b/configs/k230_canmv_defconfig
@@ -7,6 +7,7 @@ CONFIG_DEFAULT_DEVICE_TREE="k230-canmv"
 CONFIG_SYS_LOAD_ADDR=0xc000000
 CONFIG_TARGET_K230_CANMV=y
 CONFIG_ARCH_RV64I=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_SYS_PROMPT="K230# "
 CONFIG_CMD_USB=y
diff --git a/configs/kontron-sl-mx8mm_defconfig b/configs/kontron-sl-mx8mm_defconfig
index cdf8e4064838..4f08f2c572ca 100644
--- a/configs/kontron-sl-mx8mm_defconfig
+++ b/configs/kontron-sl-mx8mm_defconfig
@@ -41,6 +41,7 @@ CONFIG_OF_BOARD_SETUP=y
 CONFIG_SYS_CBSIZE=2048
 CONFIG_SYS_PBSIZE=276
 CONFIG_BOARD_TYPES=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_BOARD_INIT=y
 # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
diff --git a/configs/kontron_sl28_defconfig b/configs/kontron_sl28_defconfig
index 6ddd21bd295d..e97534ecc0a4 100644
--- a/configs/kontron_sl28_defconfig
+++ b/configs/kontron_sl28_defconfig
@@ -47,6 +47,7 @@ CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=276
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 # CONFIG_HWCONFIG is not set
 CONFIG_PCI_INIT_R=y
diff --git a/configs/mt7622_rfb_defconfig b/configs/mt7622_rfb_defconfig
index 08a88e1f33df..7213c8788307 100644
--- a/configs/mt7622_rfb_defconfig
+++ b/configs/mt7622_rfb_defconfig
@@ -16,6 +16,7 @@ CONFIG_DEFAULT_FDT_FILE="mt7622-rfb"
 CONFIG_SYS_PBSIZE=1049
 CONFIG_LOGLEVEL=7
 CONFIG_LOG=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="MT7622> "
 CONFIG_SYS_MAXARGS=8
 CONFIG_CMD_BOOTMENU=y
diff --git a/configs/mt7981_emmc_rfb_defconfig b/configs/mt7981_emmc_rfb_defconfig
index dac7d341131b..4f96cc50b409 100644
--- a/configs/mt7981_emmc_rfb_defconfig
+++ b/configs/mt7981_emmc_rfb_defconfig
@@ -20,6 +20,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=1049
 CONFIG_LOGLEVEL=7
 CONFIG_LOG=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="MT7981> "
 # CONFIG_BOOTM_NETBSD is not set
 # CONFIG_BOOTM_PLAN9 is not set
diff --git a/configs/mt7981_rfb_defconfig b/configs/mt7981_rfb_defconfig
index 80f7a7ff924e..3b950a0db84d 100644
--- a/configs/mt7981_rfb_defconfig
+++ b/configs/mt7981_rfb_defconfig
@@ -17,6 +17,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=1049
 CONFIG_LOGLEVEL=7
 CONFIG_LOG=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="MT7981> "
 # CONFIG_BOOTM_NETBSD is not set
 # CONFIG_BOOTM_PLAN9 is not set
diff --git a/configs/mt7981_sd_rfb_defconfig b/configs/mt7981_sd_rfb_defconfig
index 47203ff4e644..0f56ca8a37c0 100644
--- a/configs/mt7981_sd_rfb_defconfig
+++ b/configs/mt7981_sd_rfb_defconfig
@@ -20,6 +20,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=1049
 CONFIG_LOGLEVEL=7
 CONFIG_LOG=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="MT7981> "
 # CONFIG_BOOTM_NETBSD is not set
 # CONFIG_BOOTM_PLAN9 is not set
diff --git a/configs/mt7986_rfb_defconfig b/configs/mt7986_rfb_defconfig
index 696741d4264a..9d7554c5da77 100644
--- a/configs/mt7986_rfb_defconfig
+++ b/configs/mt7986_rfb_defconfig
@@ -17,6 +17,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=1049
 CONFIG_LOGLEVEL=7
 CONFIG_LOG=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="MT7986> "
 # CONFIG_BOOTM_NETBSD is not set
 # CONFIG_BOOTM_PLAN9 is not set
diff --git a/configs/mt7986a_bpir3_emmc_defconfig b/configs/mt7986a_bpir3_emmc_defconfig
index ef6a4822c188..153c1934bd0a 100644
--- a/configs/mt7986a_bpir3_emmc_defconfig
+++ b/configs/mt7986a_bpir3_emmc_defconfig
@@ -20,6 +20,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=1049
 CONFIG_LOGLEVEL=7
 CONFIG_LOG=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="BPI-R3> "
 # CONFIG_BOOTM_NETBSD is not set
 # CONFIG_BOOTM_PLAN9 is not set
diff --git a/configs/mt7986a_bpir3_sd_defconfig b/configs/mt7986a_bpir3_sd_defconfig
index 3d971f5c3134..ad9711da614f 100644
--- a/configs/mt7986a_bpir3_sd_defconfig
+++ b/configs/mt7986a_bpir3_sd_defconfig
@@ -20,6 +20,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=1049
 CONFIG_LOGLEVEL=7
 CONFIG_LOG=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="BPI-R3> "
 # CONFIG_BOOTM_NETBSD is not set
 # CONFIG_BOOTM_PLAN9 is not set
diff --git a/configs/mt7987_emmc_rfb_defconfig b/configs/mt7987_emmc_rfb_defconfig
index 022ca32169ba..26be8ea44917 100644
--- a/configs/mt7987_emmc_rfb_defconfig
+++ b/configs/mt7987_emmc_rfb_defconfig
@@ -20,6 +20,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=1049
 CONFIG_LOGLEVEL=7
 CONFIG_LOG=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="MT7987> "
 # CONFIG_BOOTM_NETBSD is not set
 # CONFIG_BOOTM_PLAN9 is not set
diff --git a/configs/mt7987_rfb_defconfig b/configs/mt7987_rfb_defconfig
index c6a88e7e9d39..ea43483d7ed7 100644
--- a/configs/mt7987_rfb_defconfig
+++ b/configs/mt7987_rfb_defconfig
@@ -19,6 +19,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=1049
 CONFIG_LOGLEVEL=7
 CONFIG_LOG=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="MT7987> "
 # CONFIG_BOOTM_NETBSD is not set
 # CONFIG_BOOTM_PLAN9 is not set
diff --git a/configs/mt7987_sd_rfb_defconfig b/configs/mt7987_sd_rfb_defconfig
index ca7714b12429..70eb5afb999c 100644
--- a/configs/mt7987_sd_rfb_defconfig
+++ b/configs/mt7987_sd_rfb_defconfig
@@ -20,6 +20,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=1049
 CONFIG_LOGLEVEL=7
 CONFIG_LOG=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="MT7987> "
 # CONFIG_BOOTM_NETBSD is not set
 # CONFIG_BOOTM_PLAN9 is not set
diff --git a/configs/mt7988_rfb_defconfig b/configs/mt7988_rfb_defconfig
index eebf7fb43bad..f492ad8da58b 100644
--- a/configs/mt7988_rfb_defconfig
+++ b/configs/mt7988_rfb_defconfig
@@ -18,6 +18,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=1049
 CONFIG_LOGLEVEL=7
 CONFIG_LOG=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="MT7988> "
 # CONFIG_BOOTM_NETBSD is not set
 # CONFIG_BOOTM_PLAN9 is not set
diff --git a/configs/mt7988_sd_rfb_defconfig b/configs/mt7988_sd_rfb_defconfig
index 99469985c5c5..a07362c84fcd 100644
--- a/configs/mt7988_sd_rfb_defconfig
+++ b/configs/mt7988_sd_rfb_defconfig
@@ -18,6 +18,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=1049
 CONFIG_LOGLEVEL=7
 CONFIG_LOG=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="MT7988> "
 # CONFIG_BOOTM_NETBSD is not set
 # CONFIG_BOOTM_PLAN9 is not set
diff --git a/configs/mt8365_evk_defconfig b/configs/mt8365_evk_defconfig
index 6ec3aa834b1a..9d8ea72370ef 100644
--- a/configs/mt8365_evk_defconfig
+++ b/configs/mt8365_evk_defconfig
@@ -10,6 +10,7 @@ CONFIG_TARGET_MT8365=y
 CONFIG_SYS_LOAD_ADDR=0x4c000000
 CONFIG_IDENT_STRING=" mt8365-evk"
 CONFIG_DEFAULT_FDT_FILE="mt8365-evk"
+# CONFIG_BOARD_INIT is not set
 CONFIG_CLK=y
 CONFIG_MMC_MTK=y
 CONFIG_BAUDRATE=921600
diff --git a/configs/mt8516_pumpkin_defconfig b/configs/mt8516_pumpkin_defconfig
index 756d974278a3..72ff8c791538 100644
--- a/configs/mt8516_pumpkin_defconfig
+++ b/configs/mt8516_pumpkin_defconfig
@@ -23,6 +23,7 @@ CONFIG_DEFAULT_FDT_FILE="mt8516-pumpkin"
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=276
 # CONFIG_DISPLAY_BOARDINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_HUSH_PARSER=y
 # CONFIG_CMD_BDI is not set
diff --git a/configs/mx6memcal_defconfig b/configs/mx6memcal_defconfig
index 4011b8ef7ff2..53e9804b0dd3 100644
--- a/configs/mx6memcal_defconfig
+++ b/configs/mx6memcal_defconfig
@@ -14,6 +14,7 @@ CONFIG_SYS_MEMTEST_START=0x10000000
 CONFIG_SYS_MEMTEST_END=0x20000000
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_SYS_PBSIZE=528
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SYS_MALLOC=y
 CONFIG_SPL_WATCHDOG=y
 CONFIG_HUSH_PARSER=y
diff --git a/configs/octeontx2_95xx_defconfig b/configs/octeontx2_95xx_defconfig
index 92592ad21957..381fa6bb3dd6 100644
--- a/configs/octeontx2_95xx_defconfig
+++ b/configs/octeontx2_95xx_defconfig
@@ -37,6 +37,7 @@ CONFIG_BOOTARGS="console=ttyAMA0,115200n8 earlycon=pl011,0x87e028000000 maxcpus=
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_BOARD_EARLY_INIT_R=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_SYS_PROMPT="Marvell> "
 CONFIG_CMD_MD5SUM=y
diff --git a/configs/octeontx2_96xx_defconfig b/configs/octeontx2_96xx_defconfig
index f77d515706b8..fc7ad18656ee 100644
--- a/configs/octeontx2_96xx_defconfig
+++ b/configs/octeontx2_96xx_defconfig
@@ -37,6 +37,7 @@ CONFIG_BOOTARGS="console=ttyAMA0,115200n8 earlycon=pl011,0x87e028000000 maxcpus=
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_BOARD_EARLY_INIT_R=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_SYS_PROMPT="Marvell> "
 CONFIG_CMD_MD5SUM=y
diff --git a/configs/odroid-go-ultra_defconfig b/configs/odroid-go-ultra_defconfig
index 97c44b1115b6..f2c8b1d237c8 100644
--- a/configs/odroid-go-ultra_defconfig
+++ b/configs/odroid-go-ultra_defconfig
@@ -23,6 +23,7 @@ CONFIG_FIT_VERBOSE=y
 CONFIG_LEGACY_IMAGE_FORMAT=y
 CONFIG_OF_BOARD_SETUP=y
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_MAXARGS=32
 # CONFIG_CMD_BDI is not set
 # CONFIG_CMD_IMI is not set
diff --git a/configs/openpiton_riscv64_defconfig b/configs/openpiton_riscv64_defconfig
index 1e693c621eb6..31b0dd58c171 100644
--- a/configs/openpiton_riscv64_defconfig
+++ b/configs/openpiton_riscv64_defconfig
@@ -23,6 +23,7 @@ CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="fdt addr ${fdtcontroladdr}; fdt move ${fdtcontroladdr} ${fdt_addr_r}; load mmc ${mmcdev}:${mmcpart} ${kernel_addr_r} ${image}; booti ${kernel_addr_r} - ${fdt_addr_r}; "
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=284
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="openpiton$ "
 # CONFIG_CMD_CPU is not set
 CONFIG_CMD_BOOTZ=y
diff --git a/configs/openpiton_riscv64_spl_defconfig b/configs/openpiton_riscv64_spl_defconfig
index 13d956aea322..92f4c16ff763 100644
--- a/configs/openpiton_riscv64_spl_defconfig
+++ b/configs/openpiton_riscv64_spl_defconfig
@@ -29,6 +29,7 @@ CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="fdt addr ${fdtcontroladdr}; fdt move ${fdtcontroladdr} ${fdt_addr_r}; load mmc ${mmcdev}:${mmcpart} ${kernel_addr_r} ${image}; booti ${kernel_addr_r} - ${fdt_addr_r}; "
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=284
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x100000
 # CONFIG_SPL_LEGACY_IMAGE_FORMAT is not set
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
diff --git a/configs/pe2201_defconfig b/configs/pe2201_defconfig
index 020a2d49e609..9cc0710aaf5a 100644
--- a/configs/pe2201_defconfig
+++ b/configs/pe2201_defconfig
@@ -19,6 +19,7 @@ CONFIG_BOOTARGS="earlycon=pl011,0x2800c000 root=/dev/sda2 rw"
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_BOARD_EARLY_INIT_F=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="pe2201#"
 CONFIG_CMD_BOOTMETH=y
 # CONFIG_CMD_LZMADEC is not set
diff --git a/configs/phycore_am62ax_a53_defconfig b/configs/phycore_am62ax_a53_defconfig
index bdd7e288aa4b..05849d05be47 100644
--- a/configs/phycore_am62ax_a53_defconfig
+++ b/configs/phycore_am62ax_a53_defconfig
@@ -42,6 +42,7 @@ CONFIG_BOOTSTD_FULL=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="bootflow scan -lb; run ${boot}boot"
 CONFIG_DEFAULT_FDT_FILE="oftree"
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x58000
 CONFIG_SPL_PAD_TO=0x0
diff --git a/configs/phycore_am62ax_r5_defconfig b/configs/phycore_am62ax_r5_defconfig
index 8ee6ed73adca..01d100842de0 100644
--- a/configs/phycore_am62ax_r5_defconfig
+++ b/configs/phycore_am62ax_r5_defconfig
@@ -30,6 +30,7 @@ CONFIG_SPL_SPI=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x3B000
diff --git a/configs/phycore_am62x_a53_defconfig b/configs/phycore_am62x_a53_defconfig
index 92a159e74665..978604b0232a 100644
--- a/configs/phycore_am62x_a53_defconfig
+++ b/configs/phycore_am62x_a53_defconfig
@@ -46,6 +46,7 @@ CONFIG_BOOTSTD_FULL=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="bootflow scan -lb; run ${boot}boot"
 CONFIG_DEFAULT_FDT_FILE="oftree"
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x58000
 CONFIG_SPL_SYS_REPORT_STACK_F_USAGE=y
diff --git a/configs/phycore_am62x_r5_defconfig b/configs/phycore_am62x_r5_defconfig
index 73517e04d0a6..0368d4ef4741 100644
--- a/configs/phycore_am62x_r5_defconfig
+++ b/configs/phycore_am62x_r5_defconfig
@@ -35,6 +35,7 @@ CONFIG_SPL_SPI=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x3B000
diff --git a/configs/phycore_am64x_a53_defconfig b/configs/phycore_am64x_a53_defconfig
index 9f98b3522dc4..62c9eec971d2 100644
--- a/configs/phycore_am64x_a53_defconfig
+++ b/configs/phycore_am64x_a53_defconfig
@@ -41,6 +41,7 @@ CONFIG_BOOTSTD_FULL=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="bootflow scan -lb; run ${boot}boot"
 CONFIG_DEFAULT_FDT_FILE="oftree"
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x180000
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/phycore_am64x_r5_defconfig b/configs/phycore_am64x_r5_defconfig
index 189d0706ce5d..d1ac992dc7a9 100644
--- a/configs/phycore_am64x_r5_defconfig
+++ b/configs/phycore_am64x_r5_defconfig
@@ -35,6 +35,7 @@ CONFIG_SPL_SPI=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x180000
diff --git a/configs/poleg_evb_defconfig b/configs/poleg_evb_defconfig
index 365f6434f83e..a87e918117ce 100644
--- a/configs/poleg_evb_defconfig
+++ b/configs/poleg_evb_defconfig
@@ -23,6 +23,7 @@ CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="run common_bootargs; run romboot"
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=280
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="U-Boot>"
 CONFIG_SYS_MAXARGS=32
 CONFIG_CMD_FUSE=y
diff --git a/configs/pomelo_defconfig b/configs/pomelo_defconfig
index f70705432608..87e8e2271ff0 100644
--- a/configs/pomelo_defconfig
+++ b/configs/pomelo_defconfig
@@ -17,6 +17,7 @@ CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=280
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_BOARD_EARLY_INIT_F=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="pomelo#"
 CONFIG_OF_CONTROL=y
 CONFIG_ENV_RELOC_GD_ENV_ADDR=y
diff --git a/configs/qemu-arm-sbsa_defconfig b/configs/qemu-arm-sbsa_defconfig
index 3819670defe3..76e07cac7b67 100644
--- a/configs/qemu-arm-sbsa_defconfig
+++ b/configs/qemu-arm-sbsa_defconfig
@@ -5,6 +5,7 @@ CONFIG_TARGET_QEMU_ARM_SBSA=y
 CONFIG_EFI_VARIABLE_NO_STORE=y
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="bootflow scan"
+# CONFIG_BOARD_INIT is not set
 CONFIG_EFI_PARTITION=y
 CONFIG_PARTITION_TYPE_GUID=y
 CONFIG_EFI_MEDIA=y
diff --git a/configs/qemu-riscv32_defconfig b/configs/qemu-riscv32_defconfig
index cdffda262816..bf39a1da723b 100644
--- a/configs/qemu-riscv32_defconfig
+++ b/configs/qemu-riscv32_defconfig
@@ -12,6 +12,7 @@ CONFIG_FIT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_DISPLAY_CPUINFO=y
 CONFIG_DISPLAY_BOARDINFO=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_CMD_BOOTEFI_SELFTEST=y
 CONFIG_CMD_NVEDIT_EFI=y
 # CONFIG_CMD_MII is not set
diff --git a/configs/qemu-riscv32_smode_defconfig b/configs/qemu-riscv32_smode_defconfig
index 3d065b6a9fbb..2a876aefecdf 100644
--- a/configs/qemu-riscv32_smode_defconfig
+++ b/configs/qemu-riscv32_smode_defconfig
@@ -13,6 +13,7 @@ CONFIG_FIT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_DISPLAY_CPUINFO=y
 CONFIG_DISPLAY_BOARDINFO=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_CMD_BOOTEFI_SELFTEST=y
 CONFIG_CMD_NVEDIT_EFI=y
 # CONFIG_CMD_MII is not set
diff --git a/configs/qemu-riscv32_spl_defconfig b/configs/qemu-riscv32_spl_defconfig
index 15f1a5d973df..36f8b457586a 100644
--- a/configs/qemu-riscv32_spl_defconfig
+++ b/configs/qemu-riscv32_spl_defconfig
@@ -17,6 +17,7 @@ CONFIG_SPL_LOAD_FIT_ADDRESS=0x80200000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_DISPLAY_CPUINFO=y
 CONFIG_DISPLAY_BOARDINFO=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x100000
 CONFIG_SPL_SYS_MALLOC=y
 # CONFIG_CMD_MII is not set
diff --git a/configs/qemu-riscv64_defconfig b/configs/qemu-riscv64_defconfig
index bf9a0b07400c..a9ff831be914 100644
--- a/configs/qemu-riscv64_defconfig
+++ b/configs/qemu-riscv64_defconfig
@@ -12,6 +12,7 @@ CONFIG_FIT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_DISPLAY_CPUINFO=y
 CONFIG_DISPLAY_BOARDINFO=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_CMD_BOOTEFI_SELFTEST=y
 CONFIG_CMD_NVEDIT_EFI=y
 # CONFIG_CMD_MII is not set
diff --git a/configs/qemu-riscv64_smode_defconfig b/configs/qemu-riscv64_smode_defconfig
index 6cc42817970d..8384fe78a31e 100644
--- a/configs/qemu-riscv64_smode_defconfig
+++ b/configs/qemu-riscv64_smode_defconfig
@@ -15,6 +15,7 @@ CONFIG_USE_PREBOOT=y
 CONFIG_PREBOOT="setenv fdt_addr ${fdtcontroladdr}; fdt addr ${fdtcontroladdr};"
 CONFIG_DISPLAY_CPUINFO=y
 CONFIG_DISPLAY_BOARDINFO=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_CMD_BOOTEFI_SELFTEST=y
 CONFIG_CMD_NVEDIT_EFI=y
 # CONFIG_CMD_MII is not set
diff --git a/configs/qemu-riscv64_spl_defconfig b/configs/qemu-riscv64_spl_defconfig
index 1c7cef056c49..34e14b8f8df7 100644
--- a/configs/qemu-riscv64_spl_defconfig
+++ b/configs/qemu-riscv64_spl_defconfig
@@ -16,6 +16,7 @@ CONFIG_SPL_LOAD_FIT_ADDRESS=0x80200000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_DISPLAY_CPUINFO=y
 CONFIG_DISPLAY_BOARDINFO=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x100000
 CONFIG_SPL_SYS_MALLOC=y
 # CONFIG_CMD_MII is not set
diff --git a/configs/qemu_arm64_defconfig b/configs/qemu_arm64_defconfig
index 39afb837e411..358bb1aeeb96 100644
--- a/configs/qemu_arm64_defconfig
+++ b/configs/qemu_arm64_defconfig
@@ -25,6 +25,7 @@ CONFIG_LEGACY_IMAGE_FORMAT=y
 CONFIG_USE_PREBOOT=y
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_PCI_INIT_R=y
 CONFIG_BLOBLIST=y
 CONFIG_CMD_SMBIOS=y
diff --git a/configs/qemu_arm_defconfig b/configs/qemu_arm_defconfig
index 92ba48f6af97..d5890bf87fb3 100644
--- a/configs/qemu_arm_defconfig
+++ b/configs/qemu_arm_defconfig
@@ -27,6 +27,7 @@ CONFIG_LEGACY_IMAGE_FORMAT=y
 CONFIG_USE_PREBOOT=y
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_PCI_INIT_R=y
 CONFIG_CMD_BOOTEFI_SELFTEST=y
 CONFIG_CMD_NVEDIT_EFI=y
diff --git a/configs/renesas_rzg2l_smarc_defconfig b/configs/renesas_rzg2l_smarc_defconfig
index e7c0a7e1eae6..c2bdc5210182 100644
--- a/configs/renesas_rzg2l_smarc_defconfig
+++ b/configs/renesas_rzg2l_smarc_defconfig
@@ -19,6 +19,7 @@ CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_SYS_PBSIZE=2068
 # CONFIG_BOARD_EARLY_INIT_F is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_MALLOC_BOOTPARAMS=y
 CONFIG_HUSH_PARSER=y
 CONFIG_CMD_CLK=y
diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index 374dcb1d5ba6..fc027b6d0fda 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -27,6 +27,7 @@ CONFIG_CONSOLE_RECORD=y
 CONFIG_CONSOLE_RECORD_OUT_SIZE=0x6000
 CONFIG_PRE_CONSOLE_BUFFER=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_ANDROID_AB=y
 CONFIG_CMD_CPU=y
 CONFIG_CMD_LICENSE=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 2eba02e1f07d..6ef3a98d93bc 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -49,6 +49,7 @@ CONFIG_LOG_MAX_LEVEL=9
 CONFIG_LOG_DEFAULT_LEVEL=6
 CONFIG_LOGF_FUNC=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_STACKPROTECTOR=y
 CONFIG_ANDROID_AB=y
 CONFIG_CMD_CPU=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index e81941fb14fe..b9c378cf696c 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -26,6 +26,7 @@ CONFIG_BOOTSTAGE_STASH_SIZE=0x4096
 CONFIG_CONSOLE_RECORD=y
 CONFIG_CONSOLE_RECORD_OUT_SIZE=0x6000
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_CMD_CPU=y
 CONFIG_CMD_LICENSE=y
 CONFIG_CMD_BOOTZ=y
diff --git a/configs/sandbox_noinst_defconfig b/configs/sandbox_noinst_defconfig
index a0702d6f6e17..806ca6334d40 100644
--- a/configs/sandbox_noinst_defconfig
+++ b/configs/sandbox_noinst_defconfig
@@ -33,6 +33,7 @@ CONFIG_BOOTSTAGE_STASH_SIZE=0x4096
 CONFIG_CONSOLE_RECORD=y
 CONFIG_CONSOLE_RECORD_OUT_SIZE=0x1000
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_NO_BSS_LIMIT=y
 CONFIG_HANDOFF=y
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index f1c48c84b62c..dca5ed956a22 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -28,6 +28,7 @@ CONFIG_BOOTSTAGE_STASH_SIZE=0x4096
 CONFIG_CONSOLE_RECORD=y
 CONFIG_CONSOLE_RECORD_OUT_SIZE=0x1000
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_NO_BSS_LIMIT=y
 CONFIG_HANDOFF=y
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/sandbox_vpl_defconfig b/configs/sandbox_vpl_defconfig
index 9d75bb5f933e..e1e11ca222f9 100644
--- a/configs/sandbox_vpl_defconfig
+++ b/configs/sandbox_vpl_defconfig
@@ -39,6 +39,7 @@ CONFIG_BOOTSTAGE_STASH_SIZE=0x4096
 CONFIG_CONSOLE_RECORD=y
 CONFIG_CONSOLE_RECORD_OUT_SIZE=0x1000
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_BLOBLIST_SIZE=0x5000
 CONFIG_SPL_NO_BSS_LIMIT=y
 CONFIG_HANDOFF=y
diff --git a/configs/sipeed_licheerv_nano_defconfig b/configs/sipeed_licheerv_nano_defconfig
index 14fefa968c67..fc7f82e878a6 100644
--- a/configs/sipeed_licheerv_nano_defconfig
+++ b/configs/sipeed_licheerv_nano_defconfig
@@ -18,6 +18,7 @@ CONFIG_SD_BOOT=y
 CONFIG_BOOTCOMMAND="run distro_bootcmd"
 CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=544
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="licheerv_nano# "
 # CONFIG_CMD_BOOTDEV is not set
 CONFIG_CMD_MBR=y
diff --git a/configs/sipeed_maix_bitm_defconfig b/configs/sipeed_maix_bitm_defconfig
index b2e21c7d7aee..9fcdfb4a8fec 100644
--- a/configs/sipeed_maix_bitm_defconfig
+++ b/configs/sipeed_maix_bitm_defconfig
@@ -16,6 +16,7 @@ CONFIG_BOOTCOMMAND="run k210_bootcmd"
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=276
 CONFIG_BOARD_EARLY_INIT_F=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_MTDIDS_DEFAULT="nor0=spi3:0"
 CONFIG_MTDPARTS_DEFAULT="nor0:1M(u-boot),0x1000@0xfff000(env)"
diff --git a/configs/sipeed_maix_smode_defconfig b/configs/sipeed_maix_smode_defconfig
index d838b252d53c..11d786887807 100644
--- a/configs/sipeed_maix_smode_defconfig
+++ b/configs/sipeed_maix_smode_defconfig
@@ -17,6 +17,7 @@ CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="run k210_bootcmd"
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=276
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 CONFIG_MTDIDS_DEFAULT="nor0=spi3:0"
 CONFIG_MTDPARTS_DEFAULT="nor0:1M(u-boot),0x1000@0xfff000(env)"
diff --git a/configs/stih410-b2260_defconfig b/configs/stih410-b2260_defconfig
index c0992f397f68..8282271d0ed6 100644
--- a/configs/stih410-b2260_defconfig
+++ b/configs/stih410-b2260_defconfig
@@ -20,6 +20,7 @@ CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyAS1,115200 CONSOLE=/dev/ttyAS1 consoleblank=0 root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait mem=992M@0x40000000 vmalloc=256m"
 CONFIG_SYS_PBSIZE=1058
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="stih410-b2260 => "
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GPT=y
diff --git a/configs/stm32f429-discovery_defconfig b/configs/stm32f429-discovery_defconfig
index 36e57edbb4d6..45dc8bb0ceed 100644
--- a/configs/stm32f429-discovery_defconfig
+++ b/configs/stm32f429-discovery_defconfig
@@ -19,6 +19,7 @@ CONFIG_BOOTARGS="console=ttySTM0,115200 earlyprintk consoleblank=0 ignore_loglev
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_MISC_INIT_R=y
 CONFIG_HUSH_PARSER=y
 CONFIG_SYS_PROMPT="U-Boot > "
diff --git a/configs/stm32f429-evaluation_defconfig b/configs/stm32f429-evaluation_defconfig
index a2ce8c80e208..02fc2dc521ac 100644
--- a/configs/stm32f429-evaluation_defconfig
+++ b/configs/stm32f429-evaluation_defconfig
@@ -14,6 +14,7 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=3
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_MISC_INIT_R=y
 CONFIG_SYS_PROMPT="U-Boot > "
 CONFIG_CMD_IMLS=y
diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-discovery_defconfig
index 7a1fe576cc38..f0aab073bae0 100644
--- a/configs/stm32f469-discovery_defconfig
+++ b/configs/stm32f469-discovery_defconfig
@@ -15,6 +15,7 @@ CONFIG_BOOTDELAY=3
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_CYCLIC_MAX_CPU_TIME_US=50000
+# CONFIG_BOARD_INIT is not set
 CONFIG_MISC_INIT_R=y
 CONFIG_SYS_PROMPT="U-Boot > "
 CONFIG_CMD_IMLS=y
diff --git a/configs/stm32h743-disco_defconfig b/configs/stm32h743-disco_defconfig
index 38312e9a5f12..5818e68ff7e5 100644
--- a/configs/stm32h743-disco_defconfig
+++ b/configs/stm32h743-disco_defconfig
@@ -20,6 +20,7 @@ CONFIG_DEFAULT_FDT_FILE="stm32h743i-disco"
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=282
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="U-Boot > "
 CONFIG_CMD_GPT=y
 CONFIG_CMD_MMC=y
diff --git a/configs/stm32h743-eval_defconfig b/configs/stm32h743-eval_defconfig
index fcbf7177690a..3ee8d082da8c 100644
--- a/configs/stm32h743-eval_defconfig
+++ b/configs/stm32h743-eval_defconfig
@@ -20,6 +20,7 @@ CONFIG_DEFAULT_FDT_FILE="stm32h743i-eval"
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=282
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="U-Boot > "
 CONFIG_CMD_GPT=y
 CONFIG_CMD_MMC=y
diff --git a/configs/stm32h747-disco_defconfig b/configs/stm32h747-disco_defconfig
index 5bb87eee5105..bea1fa5a8090 100644
--- a/configs/stm32h747-disco_defconfig
+++ b/configs/stm32h747-disco_defconfig
@@ -20,6 +20,7 @@ CONFIG_DEFAULT_FDT_FILE="stm32h747i-disco"
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=282
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="U-Boot > "
 CONFIG_CMD_GPT=y
 CONFIG_CMD_MMC=y
diff --git a/configs/stm32h750-art-pi_defconfig b/configs/stm32h750-art-pi_defconfig
index 8a7c45f74a4d..971d5c00d88f 100644
--- a/configs/stm32h750-art-pi_defconfig
+++ b/configs/stm32h750-art-pi_defconfig
@@ -25,6 +25,7 @@ CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=282
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_BOARD_EARLY_INIT_F=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SYS_PROMPT="U-Boot > "
 CONFIG_CMD_GPT=y
diff --git a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
index cfbe5a4ae91b..2e86abac8012 100644
--- a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
+++ b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
@@ -20,6 +20,7 @@ CONFIG_FIT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_SYS_PBSIZE=1050
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_FOOTPRINT_LIMIT=y
 CONFIG_SPL_MAX_FOOTPRINT=0x3db00
 # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
diff --git a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
index f6ca1700a5f9..b800b4c40734 100644
--- a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
+++ b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
@@ -20,6 +20,7 @@ CONFIG_FIT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_SYS_PBSIZE=1050
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_FOOTPRINT_LIMIT=y
 CONFIG_SPL_MAX_FOOTPRINT=0x3db00
 # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
index 16524245ce1c..870e17e451ab 100644
--- a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
+++ b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
@@ -20,6 +20,7 @@ CONFIG_FIT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_SYS_PBSIZE=1050
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_FOOTPRINT_LIMIT=y
 CONFIG_SPL_MAX_FOOTPRINT=0x3db00
 # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
index 3348b3f05460..88ee89aa13a3 100644
--- a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
+++ b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
@@ -20,6 +20,7 @@ CONFIG_FIT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_SYS_PBSIZE=1050
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_FOOTPRINT_LIMIT=y
 CONFIG_SPL_MAX_FOOTPRINT=0x3db00
 # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
diff --git a/configs/thunderx_88xx_defconfig b/configs/thunderx_88xx_defconfig
index 7dd75bfe3651..7fe0d87a3e22 100644
--- a/configs/thunderx_88xx_defconfig
+++ b/configs/thunderx_88xx_defconfig
@@ -23,6 +23,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=544
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_HUSH_PARSER=y
 # CONFIG_AUTO_COMPLETE is not set
 CONFIG_SYS_PROMPT="ThunderX_88XX> "
diff --git a/configs/tools-only_defconfig b/configs/tools-only_defconfig
index c90dfe517d68..42ec59575100 100644
--- a/configs/tools-only_defconfig
+++ b/configs/tools-only_defconfig
@@ -22,6 +22,7 @@ CONFIG_CMD_BOOTI=n
 CONFIG_CMD_ELF=n
 CONFIG_CMD_EXTENSION=n
 CONFIG_CMD_DATE=n
+CONFIG_BOARD_INIT=n
 CONFIG_OF_CONTROL=y
 CONFIG_ENV_RELOC_GD_ENV_ADDR=y
 CONFIG_NO_NET=y
diff --git a/configs/toradex-smarc-imx8mp_defconfig b/configs/toradex-smarc-imx8mp_defconfig
index 0489f4441152..f8a984f1e6b7 100644
--- a/configs/toradex-smarc-imx8mp_defconfig
+++ b/configs/toradex-smarc-imx8mp_defconfig
@@ -46,7 +46,7 @@ CONFIG_SYS_PBSIZE=2081
 CONFIG_LOG=y
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_DISPLAY_BOARDINFO_LATE=y
-CONFIG_ARCH_MISC_INIT=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x26000
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_BOOTROM_SUPPORT=y
diff --git a/configs/total_compute_defconfig b/configs/total_compute_defconfig
index cce58d31994d..74dcc455f7a4 100644
--- a/configs/total_compute_defconfig
+++ b/configs/total_compute_defconfig
@@ -23,6 +23,7 @@ CONFIG_SYS_CBSIZE=512
 CONFIG_SYS_PBSIZE=544
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_BLOBLIST=y
 CONFIG_BLOBLIST_PASSAGE_MANDATORY=y
 CONFIG_SYS_PROMPT="TOTAL_COMPUTE# "
diff --git a/configs/verdin-am62_a53_defconfig b/configs/verdin-am62_a53_defconfig
index e36b55faec16..9fc5184e74aa 100644
--- a/configs/verdin-am62_a53_defconfig
+++ b/configs/verdin-am62_a53_defconfig
@@ -41,6 +41,7 @@ CONFIG_PREBOOT="test -n ${fdtfile} || setenv fdtfile k3-am625-verdin-${variant}-
 CONFIG_LOG=y
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x58000
 CONFIG_SPL_SYS_REPORT_STACK_F_USAGE=y
diff --git a/configs/verdin-am62_r5_defconfig b/configs/verdin-am62_r5_defconfig
index 5cc7d050c33a..efba857ad708 100644
--- a/configs/verdin-am62_r5_defconfig
+++ b/configs/verdin-am62_r5_defconfig
@@ -28,6 +28,7 @@ CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x3B000
diff --git a/configs/verdin-am62p_a53_defconfig b/configs/verdin-am62p_a53_defconfig
index 7e6132cde534..3daf22ff8fff 100644
--- a/configs/verdin-am62p_a53_defconfig
+++ b/configs/verdin-am62p_a53_defconfig
@@ -42,6 +42,7 @@ CONFIG_PREBOOT="test -n ${fdtfile} || setenv fdtfile k3-am62p5-verdin-${variant}
 CONFIG_LOG=y
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+# CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x80000
 CONFIG_SPL_SYS_REPORT_STACK_F_USAGE=y
diff --git a/configs/verdin-am62p_r5_defconfig b/configs/verdin-am62p_r5_defconfig
index 42361523ab32..a8b0e942b611 100644
--- a/configs/verdin-am62p_r5_defconfig
+++ b/configs/verdin-am62p_r5_defconfig
@@ -28,6 +28,7 @@ CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 CONFIG_SPL_MAX_SIZE=0x3B000
diff --git a/configs/xenguest_arm64_defconfig b/configs/xenguest_arm64_defconfig
index e9a5219a7c42..161fa1a6effc 100644
--- a/configs/xenguest_arm64_defconfig
+++ b/configs/xenguest_arm64_defconfig
@@ -12,6 +12,7 @@ CONFIG_IDENT_STRING=" xenguest"
 CONFIG_BOOTDELAY=10
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_SYS_PBSIZE=1051
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="xenguest# "
 # CONFIG_CMD_BDI is not set
 # CONFIG_CMD_BOOTD is not set
diff --git a/configs/xenguest_arm64_virtio_defconfig b/configs/xenguest_arm64_virtio_defconfig
index acf131fc837c..ebd2c9b483a8 100644
--- a/configs/xenguest_arm64_virtio_defconfig
+++ b/configs/xenguest_arm64_virtio_defconfig
@@ -14,6 +14,7 @@ CONFIG_PCI=y
 CONFIG_BOOTDELAY=10
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_SYS_PBSIZE=1051
+# CONFIG_BOARD_INIT is not set
 CONFIG_PCI_INIT_R=y
 CONFIG_SYS_PROMPT="xenguest# "
 # CONFIG_CMD_BDI is not set
diff --git a/configs/xilinx_mbv32_defconfig b/configs/xilinx_mbv32_defconfig
index 7dde2fc0a8f1..92f7aa04ec0f 100644
--- a/configs/xilinx_mbv32_defconfig
+++ b/configs/xilinx_mbv32_defconfig
@@ -24,6 +24,7 @@ CONFIG_SPL_LOAD_FIT_ADDRESS=0x80200000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_DISPLAY_CPUINFO=y
 CONFIG_DISPLAY_BOARDINFO=y
+# CONFIG_BOARD_INIT is not set
 # CONFIG_BOARD_LATE_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x40000
 # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
diff --git a/configs/xilinx_mbv32_smode_defconfig b/configs/xilinx_mbv32_smode_defconfig
index b96b02c6125e..b61ec90d0969 100644
--- a/configs/xilinx_mbv32_smode_defconfig
+++ b/configs/xilinx_mbv32_smode_defconfig
@@ -25,6 +25,7 @@ CONFIG_SPL_LOAD_FIT_ADDRESS=0x80200000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_DISPLAY_CPUINFO=y
 CONFIG_DISPLAY_BOARDINFO=y
+# CONFIG_BOARD_INIT is not set
 # CONFIG_BOARD_LATE_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x40000
 # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
diff --git a/configs/xilinx_mbv64_defconfig b/configs/xilinx_mbv64_defconfig
index 77fcf4d68651..c4d458370b65 100644
--- a/configs/xilinx_mbv64_defconfig
+++ b/configs/xilinx_mbv64_defconfig
@@ -25,6 +25,7 @@ CONFIG_SPL_LOAD_FIT_ADDRESS=0x80200000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_DISPLAY_CPUINFO=y
 CONFIG_DISPLAY_BOARDINFO=y
+# CONFIG_BOARD_INIT is not set
 # CONFIG_BOARD_LATE_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x40000
 # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
diff --git a/configs/xilinx_mbv64_smode_defconfig b/configs/xilinx_mbv64_smode_defconfig
index e53c0771baf6..2d7227c9e339 100644
--- a/configs/xilinx_mbv64_smode_defconfig
+++ b/configs/xilinx_mbv64_smode_defconfig
@@ -26,6 +26,7 @@ CONFIG_SPL_LOAD_FIT_ADDRESS=0x80200000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_DISPLAY_CPUINFO=y
 CONFIG_DISPLAY_BOARDINFO=y
+# CONFIG_BOARD_INIT is not set
 # CONFIG_BOARD_LATE_INIT is not set
 CONFIG_SPL_MAX_SIZE=0x40000
 # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
diff --git a/configs/xilinx_zynqmp_r5_defconfig b/configs/xilinx_zynqmp_r5_defconfig
index d4ec2b59b710..81ea0e175ff5 100644
--- a/configs/xilinx_zynqmp_r5_defconfig
+++ b/configs/xilinx_zynqmp_r5_defconfig
@@ -18,6 +18,7 @@ CONFIG_BOOTSTAGE=y
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=284
 # CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_BOARD_INIT is not set
 CONFIG_SYS_PROMPT="ZynqMP r5> "
 CONFIG_SYS_MAXARGS=32
 # CONFIG_CMD_SETEXPR is not set
-- 
2.39.5

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
