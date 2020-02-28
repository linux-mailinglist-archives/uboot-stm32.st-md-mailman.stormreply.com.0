Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0441739A6
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 15:18:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94C33C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 14:18:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FCE0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2020 14:18:43 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SEDA9L026257; Fri, 28 Feb 2020 15:18:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=paDeL96UrmJm2WmpwpVqWz36i7oURu/hLZRoHJaEnh0=;
 b=0CAG2Yv/QWwYAz0vF/L/Xj3IvZ9xDNF+UaEWleL35rl2+zVyF8nTiMzVvcw3TkOYeWJf
 fhnr46Z6odvIEh1nyJwcH1Oi0Lbu6wv3lLt6mqHWLStjRPHaDylsRFZW1j8qq1HiEvGz
 9AHovNCmfPswauKis9wefHJWpVJBcaxhwrsJc9fRn+Z3ZSLC+7Cf5W2POH4N6QChB6Hl
 O0P7XoaB1OwlwVDUo2ezjr9kurz1S8bvphdrWcVNHmWK3K8TIHroNVqC23GuGYuX2/rW
 XhCewxL250fGhfDBXxF6r+pPrnRnb6XhgTVMY8/AxTk+Mny1uIqaUmU2I/VqQVNEJ1be Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yepvtvc65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 15:18:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 84CA910003A;
 Fri, 28 Feb 2020 15:18:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59BC12BF9D2;
 Fri, 28 Feb 2020 15:18:20 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Feb 2020 15:18:19 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Feb 2020 15:18:11 +0100
Message-ID: <20200228141816.1644-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228141816.1644-1-patrick.delaunay@st.com>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_04:2020-02-28,
 2020-02-28 signatures=0
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Stefan Roese <sr@denx.de>,
 Adam Ford <aford173@gmail.com>, Lukas Auer <lukas.auer@aisec.fraunhofer.de>
Subject: [Uboot-stm32] [PATCH 2/7] Kconfig: update reference to README.x86
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

Update reference in Kconfig detected by
scripts/documentation-file-ref-check

README.x86 => doc/arch/x86.rst

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Kconfig b/Kconfig
index 66148ce477..6bb6a1e415 100644
--- a/Kconfig
+++ b/Kconfig
@@ -236,7 +236,7 @@ config BUILD_ROM
 	  This option allows to build a ROM version of U-Boot.
 	  The build process generally requires several binary blobs
 	  which are not shipped in the U-Boot source tree.
-	  Please, see doc/README.x86 for details.
+	  Please, see doc/arch/x86.rst for details.
 
 config SPL_IMAGE
 	string "SPL image used in the combined SPL+U-Boot image"
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
