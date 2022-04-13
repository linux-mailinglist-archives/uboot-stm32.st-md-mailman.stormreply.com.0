Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F74FF9AF
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Apr 2022 17:05:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4988C628AA;
	Wed, 13 Apr 2022 15:05:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43494C628A0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 15:05:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23DEpWZL013552;
 Wed, 13 Apr 2022 17:05:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=QlLE1WYktl4cnDre41cvNt/1qEo+qPqsS7mkavjcU3o=;
 b=OWDHP2J15MKK/FBcyGzKBEHddl9Fe1ybKWiBYgEyQYoLOEIFgNzALTTMrMzbjL4SMkB4
 NO5Zevni80cYQpg9LqsRPvJx6SSZ6n9TC4dUP1ZAwCDn7k4q6mIo2HY3H/CrQLOa/tOh
 1KwIk0ULS1P+VyJR3kSxMIQZxDFFhw2MABacoEQvGTjbBeQt+cIHvv5OQoZ6M37h5Cat
 330IezkgAWe/VI6B+4lp2fsM3DIl9mUqjTwJLOm5jb666UON0foqtOAlQZD454ZQ4ar4
 zNh0z/fmDgeiIWLmBrw1mMhqtNIxHRwzofJNuhhsKnMGXxjDoUqlGegqAH1JpbbVN5FX NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fb7gpf8g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Apr 2022 17:05:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ACB0010002A;
 Wed, 13 Apr 2022 17:05:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A70EE221789;
 Wed, 13 Apr 2022 17:05:16 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Apr
 2022 17:05:16 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 13 Apr 2022 17:04:50 +0200
Message-ID: <20220413150500.23883-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220413150500.23883-1-patrice.chotard@foss.st.com>
References: <20220413150500.23883-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_02,2022-04-13_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v1 02/12] configs: stm32f746-disco: Rename
	stm32f746-disco_defconfig to stm32f746-disco_spl_defconfig
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

The current stm32f746-disco_defconfig file supports SPL, rename it to
stm32f746-disco_spl_defconfig to reflect the supported configuration.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 board/st/stm32f746-disco/MAINTAINERS                             | 1 +
 .../{stm32f746-disco_defconfig => stm32f746-disco_spl_defconfig} | 0
 2 files changed, 1 insertion(+)
 rename configs/{stm32f746-disco_defconfig => stm32f746-disco_spl_defconfig} (100%)

diff --git a/board/st/stm32f746-disco/MAINTAINERS b/board/st/stm32f746-disco/MAINTAINERS
index 3bbb513ad7..06d366e8a2 100644
--- a/board/st/stm32f746-disco/MAINTAINERS
+++ b/board/st/stm32f746-disco/MAINTAINERS
@@ -4,4 +4,5 @@ S:	Maintained
 F:	board/st/stm32f746-disco
 F:	include/configs/stm32f746-disco.h
 F:	configs/stm32f746-disco_defconfig
+F:	configs/stm32f746-disco_spl_defconfig
 F:	configs/stm32f769-disco_defconfig
diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_spl_defconfig
similarity index 100%
rename from configs/stm32f746-disco_defconfig
rename to configs/stm32f746-disco_spl_defconfig
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
