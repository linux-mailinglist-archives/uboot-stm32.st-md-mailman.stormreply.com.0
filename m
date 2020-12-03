Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 412AE2CD24D
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Dec 2020 10:16:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 056EEC56630;
	Thu,  3 Dec 2020 09:16:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17CDDC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Dec 2020 09:16:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B3936tG025472; Thu, 3 Dec 2020 10:16:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=llTTCvUdwXara1Mz3i+d3vdb+reZ7wPGQQwl5XucHtc=;
 b=MRsof6SfgaD1vbLCDUtfDcV5dPjnzLl0aKW6SGeSFjfEIYiDQKa+XpuOhmDJXmSXVNpf
 jZob7FDKD2GckHBilod92Xczz9fF4S4uLg932XaB+WStp4Cfcya8uh1JDwWGCnY/dj+Y
 xUkS7kiAayXx8T+1LifkzTEUga02jNq9DBQbpWqE1UHtozIBX6dPztaurqs2GGIkdRSX
 2YdpYwUJbk/kKLvVTWfhDp8j8PTTUbINPrh8aGzjxP984zTBHSGsV4J+Go47O/JDYjn3
 oruKhMwlGsK+X/dGVSmqy/K8rqWdHCabRDQxo+rvPMBEomKdbs8InfwuYe4Osp4FRyd9 eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3e7tu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 10:16:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D38E10002A;
 Thu,  3 Dec 2020 10:16:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FC6A233FDA;
 Thu,  3 Dec 2020 10:16:10 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec 2020 10:16:09
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 3 Dec 2020 10:15:47 +0100
Message-ID: <20201203101538.4.Ia24732fafc513769db314b46fdeb6d07aff955e5@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203091549.7031-1-patrick.delaunay@st.com>
References: <20201203091549.7031-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_03:2020-12-03,
 2020-12-03 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Akshay Saraswat <akshay.s@samsung.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 4/6] peach-pi: configs: remove
	VIDCONSOLE_AS_LCD
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

Remove the obsolete CONFIG_VIDCONSOLE_AS_LCD as vidconsole is used in
./include/configs/peach-pi.h => configs/exynos5-dt-common.h since the
commit bb5930d5c97f ("exynos: video: Convert several boards to driver
model for video")

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/peach-pi_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/peach-pi_defconfig b/configs/peach-pi_defconfig
index 01054b0ee4..0625305bd7 100644
--- a/configs/peach-pi_defconfig
+++ b/configs/peach-pi_defconfig
@@ -75,7 +75,6 @@ CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_DM_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
-CONFIG_VIDCONSOLE_AS_LCD=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_BRIDGE=y
 CONFIG_VIDEO_BRIDGE_PARADE_PS862X=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
