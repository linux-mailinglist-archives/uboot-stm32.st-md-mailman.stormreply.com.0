Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C70B114B1F2
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 10:44:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CDBEC36B0E
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 09:44:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6ABBC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:44:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S9gaqm015643; Tue, 28 Jan 2020 10:44:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=B1eSS09fBwZ4o8fgvfstnJX5IJEyd9rRPiRb8OQYTAc=;
 b=Bv+44vCZd04ojdaM5rJwP2zXRvi7yBJxqdb3iBHach5zdE7o8oJot7aXGXoSI9Abo/if
 RfU2xo13NyMJjAGtKaBYfoINQv+JUM95m2wGxur+3ho93Kt5njPT1nGBZTIyNbxSmqQ3
 Crg5MK7IqAsM3eunbtBWgswZwXMlUL3itqML/LdqsXd0RsiOxzKPryey8qyIcWqpjmrU
 7ruKl7xfkjzQecXNWNEFQBZSQRh+zuCGhwRF9h+FaE5K5Jwhd0hhpATZTttLJo0PUrWm
 wM13HMATNN8S8QIfjhp364qpVDhG91UTJl3XNRf1iiuWAux+Z4s0+7SM1N/fZ7Ufinj3 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrdekd107-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:44:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3CBE100039;
 Tue, 28 Jan 2020 10:44:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D26D221CA8C;
 Tue, 28 Jan 2020 10:44:17 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 10:44:17 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jan 2020 10:44:11 +0100
Message-ID: <20200128094415.5768-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 0/4] Several patch to solve warning on
	stm32mp1 board with W=1
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


Hi,

this serie includes few remaining patches on STM32 drivers or board
code to avoid warning when the board stm32mp1 is compiled with W=1.

See also patches on:
- ENV (V2): http://patchwork.ozlabs.org/patch/1230200/
- MTD (merged): http://patchwork.ozlabs.org/patch/1228814/

Regards



Patrick Delaunay (4):
  board: stm32mp1: board: add include for dfu
  board: stm32mp1: change dfu function to static
  pinctrl: stmfx: update the result type of dm_i2c_reg_read
  clk: stm32mp1: solve type issue in stm32mp1_lse_enable and
    stm32mp1_clktree

 board/st/stm32mp1/stm32mp1.c    | 5 +++--
 drivers/clk/clk_stm32mp1.c      | 9 +++++----
 drivers/pinctrl/pinctrl-stmfx.c | 7 ++++---
 3 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
