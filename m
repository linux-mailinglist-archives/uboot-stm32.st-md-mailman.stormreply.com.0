Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E69314D73
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 11:49:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC5F5C57B53;
	Tue,  9 Feb 2021 10:49:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01738C57B54
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 10:49:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 119AeosX032103; Tue, 9 Feb 2021 11:48:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=N8vFbKowdDHAEPj7Jy5LDHioKzbpzKWO5cJhK4T9gCw=;
 b=D8EsOMW75MuclRSWCfz8bF0UTRg5/PnPhWsjyRNTnEsF/UkkbRgfq3VDIMHjXqyzDZN5
 HCq1FYLxpH+aB3ft9bT15qXPud3S2rcWdlbY4QJ5k1Sm+eMfc0rMsU8X7a6q2IZ14010
 YLpHAd+eSdS6GY17CveSRqyMQHjkuLcJJMb2HZlSRhCTry/JAlCMHgn/LfiUkH2PmCpC
 uCKwV4eziwBTwwZpMaEt93Og0+bEA0aYbZZVecxeLDQg2yxA9LZjrx5WN0ExN8Ah5GUa
 DJxhTZAbJlWKlGvfRF2Kf0WJfzGjndfT/nPuwGCO6mbINc63z4/+08eogOzwppoBZJNv IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hr2c7ywn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 11:48:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3555310002A;
 Tue,  9 Feb 2021 11:48:57 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28067226F66;
 Tue,  9 Feb 2021 11:48:57 +0100 (CET)
Received: from localhost (10.75.127.122) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 11:48:56 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Feb 2021 11:48:51 +0100
Message-ID: <20210209114849.2.I108ef0bb214bf9eabfb9a39438381a9be6ba4b6a@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210209104852.1293-1-patrick.delaunay@foss.st.com>
References: <20210209104852.1293-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG3NODE5.st.com (10.75.127.72) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_03:2021-02-09,
 2021-02-09 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH 2/3] env: sf: update the use of macro
	ENV_SAVE_PTR
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

Remove CONFIG_IS_ENABLED(SAVEENV) as it is already tested in
the ENV_SAVE_PTR macro.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/sf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/env/sf.c b/env/sf.c
index 42d762714e..3f2fbbec12 100644
--- a/env/sf.c
+++ b/env/sf.c
@@ -405,6 +405,6 @@ U_BOOT_ENV_LOCATION(sf) = {
 	.location	= ENVL_SPI_FLASH,
 	ENV_NAME("SPIFlash")
 	.load		= env_sf_load,
-	.save		= CONFIG_IS_ENABLED(SAVEENV) ? ENV_SAVE_PTR(env_sf_save) : NULL,
+	.save		= ENV_SAVE_PTR(env_sf_save),
 	.init		= env_sf_init,
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
