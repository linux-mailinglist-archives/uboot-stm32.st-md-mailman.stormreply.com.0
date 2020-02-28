Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 880A81739A8
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 15:19:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 526A7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 14:19:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADD25C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2020 14:19:00 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SEDASt026259; Fri, 28 Feb 2020 15:18:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=0BMH0TgZ0NryfvCLD/j6povocl1D2ZqeI5+ygvWejRc=;
 b=xP0VSZXySPvGLHvuI7Jnfxug4VP1tgGAwlQPgesh2GkRGD2CfGOMQw8bVwf/8vj1tZXK
 JuF2F+GfPosGufXGvbgD+9aFza8pH81fkFA4/i2qGkzHdU6EAix4RcILvD6isXGUzvHb
 OnfZojNSnmoZ6oLhwnmhuUROCzVdDoTXESVkizIDgICMJTkqDCaYKItn0ulO5zGmkhrK
 9ZYBXQBaBbLI5XHseI0tZLGW2NU7njcvxL2rjh/18Ic4bnIernnwdgRWtA2+nYPFkTWK
 fkLWbjqSjvbfLsxeZE9t1IQQfHgNeYxsA3fmAqd1C/w3lUMB3A4s9Tzva5jyoUoysd1H qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yepvtvc68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 15:18:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41EA0100038;
 Fri, 28 Feb 2020 15:18:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6AFD2BF9D0;
 Fri, 28 Feb 2020 15:18:18 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Feb 2020 15:18:18 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Feb 2020 15:18:09 +0100
Message-ID: <20200228141816.1644-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_04:2020-02-28,
 2020-02-28 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>,
 =?UTF-8?q?Eddy=20Petri=C8=99or?= <eddy.petrisor@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Kever Yang <kever.yang@rock-chips.com>,
 "Albert ARIBAUD \(3ADEV\)" <albert.aribaud@3adev.fr>,
 Joe Hershberger <joe.hershberger@ni.com>, Ye Li <ye.li@nxp.com>,
 Lukas Auer <lukas.auer@aisec.fraunhofer.de>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, Ken Lin <Ken.Lin@advantech.com.tw>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Hu <richard.hu@technexion.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Olaf Mandel <o.mandel@menlosystems.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Ian Ray <ian.ray@ge.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jason Liu <jason.hui.liu@nxp.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Anatolij Gustschin <agust@denx.de>, Stefano Babic <sbabic@denx.de>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Alison Wang <alison.wang@nxp.com>, Troy Kisky <troy.kisky@boundarydevices.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Akshay Bhat <akshaybhat@timesys.com>, Adam Ford <aford173@gmail.com>,
 Markus Niebel <Markus.Niebel@tq-group.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Heiko Schocher <hs@denx.de>,
 Boris Brezillon <bbrezillon@kernel.org>, Simon Glass <sjg@chromium.org>,
 Fabio Estevam <fabio.estevam@nxp.com>, TsiChung Liew <Tsi-Chung.Liew@nxp.com>
Subject: [Uboot-stm32] [PATCH 0/7] doc: Fix some errors pointed out by 'make
	refcheckdocs'
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


Fix some errors pointed out by 'make refcheckdocs'.

This target is available after Heinrich patch
"scripts: add documentation-file-ref-check"
http://patchwork.ozlabs.org/patch/1244498/

see also patches
1/ "doc: fix references to driver-model"
  http://patchwork.ozlabs.org/patch/1244504/

2/ "Kconfig: fix typos in CMD_BEDBUG description"
  http://patchwork.ozlabs.org/patch/1244507/

3/ "include/ata.h: remove invalid links"
  http://patchwork.ozlabs.org/patch/1244637/

After this serie the only remaining errors are:

$> make refcheckdocs

doc/sphinx/parse-headers.pl: doc/doc-guide/parse-headers.rst
doc/sphinx/rstFlatTable.py: doc/books/kernel-doc-HOWTO
drivers/rtc/ds1374.c: Watchdoc/Alarm
include/fsl_qe.h: doc/README.qe_firmware
lib/zlib/trees.c: ftp.uu.net:/pub/archiving/zip/doc/deflate-1.1.doc



Patrick Delaunay (7):
  README: update reference to *.README
  Kconfig: update reference to README.x86
  doc: update reference to README.imximage
  doc: update reference to README.imx8image
  doc: update reference to README.board
  doc: device-tree-bindings: update reference to binding directory
  arm: imx: update reference to README.mxc_hab

 Kconfig                                                  | 2 +-
 README                                                   | 2 +-
 arch/arm/mach-imx/Kconfig                                | 4 ++--
 board/advantech/dms-ba16/dms-ba16_1g.cfg                 | 2 +-
 board/advantech/dms-ba16/dms-ba16_2g.cfg                 | 2 +-
 board/aristainetos/aristainetos2.cfg                     | 2 +-
 board/bachmann/ot1200/mx6q_4x_mt41j128.cfg               | 2 +-
 board/barco/titanium/imximage.cfg                        | 2 +-
 board/boundary/nitrogen6x/nitrogen6dl.cfg                | 2 +-
 board/boundary/nitrogen6x/nitrogen6dl2g.cfg              | 2 +-
 board/boundary/nitrogen6x/nitrogen6q.cfg                 | 2 +-
 board/boundary/nitrogen6x/nitrogen6q2g.cfg               | 2 +-
 board/boundary/nitrogen6x/nitrogen6s.cfg                 | 2 +-
 board/boundary/nitrogen6x/nitrogen6s1g.cfg               | 2 +-
 board/ccv/xpress/imximage.cfg                            | 2 +-
 board/cobra5272/README                                   | 2 +-
 board/freescale/imx8qxp_mek/imximage.cfg                 | 2 +-
 board/freescale/m52277evb/README                         | 2 +-
 board/freescale/m53017evb/README                         | 2 +-
 board/freescale/m5373evb/README                          | 2 +-
 board/freescale/m54455evb/README                         | 2 +-
 board/freescale/m547xevb/README                          | 2 +-
 board/freescale/mx25pdk/imximage.cfg                     | 2 +-
 board/freescale/mx51evk/imximage.cfg                     | 2 +-
 board/freescale/mx53ard/imximage_dd3.cfg                 | 2 +-
 board/freescale/mx53evk/imximage.cfg                     | 2 +-
 board/freescale/mx53loco/imximage.cfg                    | 2 +-
 board/freescale/mx53smd/imximage.cfg                     | 2 +-
 board/freescale/mx6qarm2/imximage.cfg                    | 2 +-
 board/freescale/mx6qarm2/imximage_mx6dl.cfg              | 2 +-
 board/freescale/mx6slevk/imximage.cfg                    | 2 +-
 board/freescale/mx6ullevk/imximage.cfg                   | 2 +-
 board/freescale/mx7dsabresd/imximage.cfg                 | 2 +-
 board/freescale/s32v234evb/s32v234evb.cfg                | 2 +-
 board/freescale/vf610twr/imximage.cfg                    | 2 +-
 board/ge/bx50v3/bx50v3.cfg                               | 2 +-
 board/ge/mx53ppd/imximage.cfg                            | 2 +-
 board/menlo/m53menlo/imximage.cfg                        | 2 +-
 board/phytec/pcm052/imximage.cfg                         | 2 +-
 board/seco/mx6quq7/mx6quq7-2g.cfg                        | 2 +-
 board/siemens/capricorn/imximage.cfg                     | 2 +-
 board/technexion/pico-imx6ul/imximage.cfg                | 2 +-
 board/toradex/apalis-imx8/apalis-imx8qm-imximage.cfg     | 2 +-
 board/toradex/colibri-imx6ull/imximage.cfg               | 2 +-
 board/toradex/colibri-imx8x/colibri-imx8qxp-imximage.cfg | 2 +-
 board/toradex/colibri_imx7/imximage.cfg                  | 2 +-
 board/toradex/colibri_vf/imximage.cfg                    | 2 +-
 board/tqc/tqma6/clocks.cfg                               | 2 +-
 board/tqc/tqma6/tqma6dl.cfg                              | 2 +-
 board/tqc/tqma6/tqma6q.cfg                               | 2 +-
 board/tqc/tqma6/tqma6s.cfg                               | 2 +-
 board/warp/imximage.cfg                                  | 2 +-
 board/warp7/imximage.cfg                                 | 2 +-
 doc/device-tree-bindings/net/ti,dp83867.txt              | 2 +-
 doc/device-tree-bindings/video/rockchip-lvds.txt         | 2 +-
 doc/imx/misc/sdp.txt                                     | 2 +-
 include/configs/sbc8548.h                                | 2 +-
 57 files changed, 58 insertions(+), 58 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
