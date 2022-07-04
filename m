Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF84156640B
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Jul 2022 09:30:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8851EC640F3;
	Tue,  5 Jul 2022 07:30:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13C72C640ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 11:11:34 +0000 (UTC)
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8A01483F2F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 13:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656933093;
 bh=3sd3CTYuIJH8rEPdRZ074rH9BFWclrWzXviyuHmlLCo=;
 h=From:To:Cc:Subject:Date:From;
 b=t8l2xmUeuZtoV2sROrFbMHeT4B/+OcryOTunxPLKWIGsGnOH2qaLq6lN3nmjk7hvQ
 PENRbo2c5pO7IRAUwGSPCc7OY2fWfWgb1JQI+fVIb0SaFyBpWcY1qEaGo7yrTBI2XF
 uJFbrK+8sPOwGPrk0R8rRWbMFR4KsMChkq84qTnnB5y7TEMTOzfr4L7qNajd+e4Jh2
 idan08945yrA6/TTGssml2rQO273mrWha6JfsXtn2/xGVCeWEPNWt2Ia8YM1QPM2wY
 VCL3E5rxFlt7x+A1UIwCIkg7qZbsg+qVGdr3R3TjoD/BjaBvKTrbF/WeocY+RZU7RS
 /6rQw2w4F+bLg==
Received: by janitor.denx.de (Postfix, from userid 108)
 id 3D19BA01FD; Mon,  4 Jul 2022 13:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on janitor.denx.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.2
Received: from xpert.denx.de (xpert.denx.de [192.168.0.4])
 by janitor.denx.de (Postfix) with ESMTPS id 9D643A005A;
 Mon,  4 Jul 2022 13:11:29 +0200 (CEST)
Received: by xpert.denx.de (Postfix, from userid 535)
 id 44D733E06E7; Mon,  4 Jul 2022 13:11:29 +0200 (CEST)
From: Philip Oberfichtner <pro@denx.de>
To: u-boot@lists.denx.de
Date: Mon,  4 Jul 2022 13:11:02 +0200
Message-Id: <20220704111106.1415208-1-pro@denx.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Tue, 05 Jul 2022 07:30:14 +0000
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, peng.fan@nxp.com,
 festevam@denx.de, u-boot@dh-electronics.com, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Philip Oberfichtner <pro@denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>, sbabic@denx.de
Subject: [Uboot-stm32] [PATCH 0/4] Deduplicate dhelectronics board files
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


This series unifies common mac address code for imx6, imx8 and stm32
based boards by DH. It is thought of as a starting point for more
deduplication in the future.


Philip Oberfichtner (4):
  board: dhelectronics: Implement common mac address functions
  ARM: imx6: DH: Use common mac address functions
  ARM: imx8: DH: Use common mac address functions
  ARM: stm32: DH: Use common mac address functions

 board/dhelectronics/common/Makefile           |  10 ++
 board/dhelectronics/common/dh_common.c        |  64 +++++++++
 board/dhelectronics/common/dh_common.h        |  28 ++++
 board/dhelectronics/common/dh_imx.c           |  24 ++++
 board/dhelectronics/common/dh_imx.h           |  12 ++
 board/dhelectronics/dh_imx6/dh_imx6.c         |  47 ++-----
 .../dh_imx8mp/imx8mp_dhcom_pdk2.c             | 121 +++++++-----------
 board/dhelectronics/dh_stm32mp1/board.c       | 104 +++++++--------
 8 files changed, 247 insertions(+), 163 deletions(-)
 create mode 100644 board/dhelectronics/common/Makefile
 create mode 100644 board/dhelectronics/common/dh_common.c
 create mode 100644 board/dhelectronics/common/dh_common.h
 create mode 100644 board/dhelectronics/common/dh_imx.c
 create mode 100644 board/dhelectronics/common/dh_imx.h

-- 
2.35.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
