Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EAB206D9E
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jun 2020 09:27:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F63FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jun 2020 07:27:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05EFDC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 07:27:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05O7OxXc019114; Wed, 24 Jun 2020 09:27:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ECBYLeJYtVdNCKq3V5CSC5kj7TYFs1QQCPD0tdFh+GU=;
 b=G1v2VmtfOfKrSTT1nu5UVPxXp3fLpM8JYPWi/PK9olCYRfFcFogRadAX0IDG4ZHkPv0Z
 n+Y2geqF3waI7bAi56nzslu32wscEwNpsY0zVb7CqN7FGZ8gK9bNlPFA3I64zlQB6asF
 hIfX5g79fU6JK6n39bTQ9Nj0vySiJQ7juAb8eV5gc1FTZ+V7cR0LpID7dEzlfB2pgSiM
 7G8daE0D4wFA1wTOvyvQit54LZ4ghTm/6wUnrSkM6O4kMy5PwJo+pFwk5xVm238iRMHe
 iuATU2cWrvn9hWWLJM9g9qJULfSFg1EnPjSwP8OWjXyDnxEcYfTGmW3mvgG6g/J83A9p Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuuca3dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 09:27:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED4F610002A;
 Wed, 24 Jun 2020 09:27:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8EF52A9919;
 Wed, 24 Jun 2020 09:27:35 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 24 Jun 2020 09:27:35 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Jun 2020 09:27:25 +0200
Message-ID: <20200624072726.24386-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_04:2020-06-24,
 2020-06-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] env: correct overflow check of env_has_init
	size
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

Correct the overflow check of the bit-field env_has_init with
the max value of env_location= ENVL_COUNT and no more with the
size of env_locations.

This bit-field is indexed by this enumerate and not by the position in
the env_locations (only used in env_get_location) and the
2 values are different, depending of thea ctivated CONFIG_ENV_IS_ options.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 env/env.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/env/env.c b/env/env.c
index dcc25c030b..49545a8d9c 100644
--- a/env/env.c
+++ b/env/env.c
@@ -103,7 +103,7 @@ static void env_set_inited(enum env_location location)
 	 * using the above enum value as the bit index. We need to
 	 * make sure that we're not overflowing it.
 	 */
-	BUILD_BUG_ON(ARRAY_SIZE(env_locations) > BITS_PER_LONG);
+	BUILD_BUG_ON(ENVL_COUNT > BITS_PER_LONG);
 
 	gd->env_has_init |= BIT(location);
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
