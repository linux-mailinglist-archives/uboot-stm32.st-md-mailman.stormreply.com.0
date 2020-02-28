Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B92A21739A3
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 15:18:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85B49C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 14:18:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 326E3C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2020 14:18:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SEDOdr025949; Fri, 28 Feb 2020 15:18:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=NnhobV7kbrVUkcrdSvT1YV4/GNaD/1jW/cBjK+HZIJc=;
 b=gcYoPtZ75aZlYlL6A/idnJFMgqce4GLC38/rs5P48V1Hduh2MnZ88U83p7TwDHupj4hI
 XYAwUgoqPZkNXvJqalAnzDQaR0pEANK9yV/6QKQaqZwFZDZpJLiAslNfYBIwUIA8U/L6
 XszipFtVCKAWgLwkfzjvXuJdhRjdnTiCp4wpJMLyQ+bnJwvQ9MeTX+W0XoBOZ1nSGrMX
 mW2bVh7qK7unphFz+jfeXGYji72PpLyN2ps7syWI31/ZFHHosRFNQQ6XClUIAuM0teQy
 vqP40PhQ1qVWAB0WZg9Z4r4y/bNRyYCYeE5n0kjkgTXLt591ibDp3jaJkwxyTt6UaANb 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yepvvcc4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 15:18:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 35538100040;
 Fri, 28 Feb 2020 15:18:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 277212BF9D0;
 Fri, 28 Feb 2020 15:18:24 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Feb 2020 15:18:23 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Feb 2020 15:18:16 +0100
Message-ID: <20200228141816.1644-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228141816.1644-1-patrick.delaunay@st.com>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_04:2020-02-28,
 2020-02-28 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@denx.de>
Subject: [Uboot-stm32] [PATCH 7/7] arm: imx: update reference to
	README.mxc_hab
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

Update reference in files detected by
scripts/documentation-file-ref-check

doc/README.mxc_hab  => doc/imx/habv4/*

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-imx/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index aa140c4798..329149900a 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -41,7 +41,7 @@ config IMX_HAB
 	imply CMD_DEKBLOB
 	help
 	  This option enables the support for secure boot (HAB).
-	  See doc/README.mxc_hab for more details.
+	  See doc/imx/habv4/* for more details.
 
 config CSF_SIZE
 	hex "Maximum size for Command Sequence File (CSF) binary"
@@ -69,7 +69,7 @@ config CMD_DEKBLOB
 	help
 	  This enables the 'dek_blob' command which is used with the
 	  Freescale secure boot mechanism. This command encapsulates and
-	  creates a blob of data. See also CMD_BLOB and doc/README.mxc_hab for
+	  creates a blob of data. See also CMD_BLOB and doc/imx/habv4/* for
 	  more information.
 
 config CMD_HDMIDETECT
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
