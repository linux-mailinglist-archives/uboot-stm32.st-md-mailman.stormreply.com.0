Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B5845029D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 11:39:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0323CC5C82A;
	Mon, 15 Nov 2021 10:39:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F33CC5C829
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 10:39:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AF7WanC010527;
 Mon, 15 Nov 2021 11:39:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=49wr6l/zOuw/4Aom/E/JTWPecTz2xuWajiko7gP0deA=;
 b=PaTXLVYpl64HJSBahm1ilCK7FllA8BVKvUBRpZ7HgFwTT6yC4CCd4/uTXYiOsxEVNuEx
 V0nWSU+xPv5H2wCe3vP1eXxfhCLM0w2aoaqEXcTlVWS8Zju58xR1Z7aOfoOCVDSHceta
 VDtnvtPyBK50U6jXBcSrMrHJWmiHHQ6/b6uv4im3u3aGZQcBMcfqNCZRw6S/XM8rim9X
 InoMdzsofZk65j/tSDqrKDoR0hiuKlaqHneAWEVttEUAGgwIvhFbVZYdrHwphGt/izQL
 PDaIYDACJrfpsutTLJzEOvMTsyOhe67ziU6XA3T9ncLmcRB83Ym+vGh4o5SskpJyFNIK Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cbk8j17fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 11:39:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83D1110002A;
 Mon, 15 Nov 2021 11:39:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75BF0229A80;
 Mon, 15 Nov 2021 11:39:22 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov 2021 11:39:22
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Nov 2021 11:39:12 +0100
Message-ID: <20211115103920.30149-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-12_01,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 0/8] ARM: dts: stm32: use lower-case hex for
	address
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

Replace upper-case hex with lower-case hex for address in STM32 device tree


Patrice Chotard (8):
  ARM: dts: stm32: Use lower-case hex for address for
    stm32mp15-u-boot.dtsi
  ARM: dts: stm32: Use lower-case hex for address for
    stm32f769-disco-u-boot.dtsi
  ARM: dts: stm32: Use lower-case hex for address for
    stm32746-disco-u-boot.dtsi
  ARM: dts: stm32: Use lower-case hex for address for
    stm32f7-u-boot.dtsi
  ARM: dts: stm32: Use lower-case hex for address for
    stm32f469-disco-u-boot.dtsi
  ARM: dts: stm32: Use lower-case hex for address for
    stm32f429-disco-u-boot.dtsi
  ARM: dts: stm32: Use lower-case hex for address for
    stm32f746g-eval-u-boot.dtsi
  ARM: dts: stm32: Use lower-case hex for address for
    stm32429i-eval-u-boot.dtsi

 arch/arm/dts/stm32429i-eval-u-boot.dtsi  | 2 +-
 arch/arm/dts/stm32746g-eval-u-boot.dtsi  | 2 +-
 arch/arm/dts/stm32f429-disco-u-boot.dtsi | 2 +-
 arch/arm/dts/stm32f469-disco-u-boot.dtsi | 6 +++---
 arch/arm/dts/stm32f7-u-boot.dtsi         | 4 ++--
 arch/arm/dts/stm32f746-disco-u-boot.dtsi | 2 +-
 arch/arm/dts/stm32f769-disco-u-boot.dtsi | 6 +++---
 arch/arm/dts/stm32mp15-u-boot.dtsi       | 8 ++++----
 8 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
