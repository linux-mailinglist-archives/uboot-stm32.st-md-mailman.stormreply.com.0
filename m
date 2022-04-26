Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6AC50FD2F
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Apr 2022 14:38:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0908C60479;
	Tue, 26 Apr 2022 12:38:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E8A0C60466
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 12:38:00 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QAAcMf009548;
 Tue, 26 Apr 2022 14:37:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=D8IJpbE/cKcmrJNhRkBHc2Rs4XO6fIb/tlVlxfmACfw=;
 b=QBwEsR/dZCJXP8piT+bbvyayPiJjLMlCwX39jjLoc8u0dKvABVfmJRW+HVB/elGv4hr3
 VNYt9XqrOekTIPSyEIrQT9EaXQrfzsAeMXObPg6U3F41fx5jVa3A2hLKUcv2vwYmCAm8
 SP2OOKg5r659femPAx6MVNAOq3Nk0rNDI8byWQ7YPq+4KhJfNr5nHELlczCZMCMUhGra
 abkpCq6o4DnL7hcxMzOoEetJhp4ZIDm89fx6gfrUfRSC7/UiVb0qTr81A+NlFv7y9Hiv
 p3w24hXC3LyYEN8ZcN1hqE29ymGVd8mTeHnnnMD0P65e0X5izRRh5ZFfTgpjd4NGEh60 xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm6vkf95y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 14:37:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 38128100038;
 Tue, 26 Apr 2022 14:37:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 318DF222CBB;
 Tue, 26 Apr 2022 14:37:56 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 26 Apr 2022 14:37:55
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Apr 2022 14:37:46 +0200
Message-ID: <20220426123750.579726-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_02,2022-02-23_01
Cc: Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/3] stm32mp: handle ck_usbo_48m clock
	provided by USBPHYC
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


Update the RCC stm32mp1 clock driver to handle the USB_PHY_48
clock provided by USBPHYC and named "ck_usbo_48m".

With this series, the clock dependencies for USB PHYC, USBOTG (including
USB detection) and USBHOST are correctly managed.

See Linux kernel commit "ARM: dts: stm32: use usbphyc ck_usbo_48m as USBH
OHCI clock on stm32mp151" and "phy: stm32: register usbphyc as clock
provider of ck_usbo_48m clock"

Patrick


Patrick Delaunay (3):
  phy: stm32-usbphyc: add counter of PLL consumer
  phy: stm32-usbphyc: usbphyc is a clock provider of ck_usbo_48m clock
  clk: stm32mp: handle ck_usbo_48m clock provided by USBPHYC

 drivers/clk/clk_stm32mp1.c      |  35 ++++----
 drivers/phy/phy-stm32-usbphyc.c | 155 ++++++++++++++++++++++++++------
 2 files changed, 147 insertions(+), 43 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
