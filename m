Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0F15246AB
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 May 2022 09:17:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5411C035BE;
	Thu, 12 May 2022 07:17:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD6B2C035BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 May 2022 07:17:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24C1mXEJ026343;
 Thu, 12 May 2022 09:17:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=OGd8mqPsJdr5Fne8tofk1VKMSQLpPmKxvUJ9LtY79xI=;
 b=CaCFD4eQh2VdTFGWdoZ5Rlz/LeJxSIMZjDn/2sg1dhDX/oUsV+3ZwlUrGRwlXNnWcmh4
 FuCOU4Ww1e+TMUuNUOOIJN3VwFOAUKIy69VRjeGcCcwQkj+6gLTJvyk0vPeIUPA7+rWf
 gz9jh/NhM8h/PtA5/1ouOywgQF8XpQVFojODz8cR3j6FQqd8/XH14sNnvchyt8Nf+Hmp
 aY1oHpVi2uVSr39zRWf9i4tZqXcVg8/hZezQqFZauQPEFBKj4qLovKhw9bPTEekfe2XQ
 l5Cy8wHwt34gZ8Ac+4W2Xdokbbs7Ny1RgGD7hH+kwcR5OFlHx5bBUGH/9wPQAekPRYNG sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwdw9fyf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 09:17:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A61B100039;
 Thu, 12 May 2022 09:17:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F624214D18;
 Thu, 12 May 2022 09:17:51 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 12 May
 2022 09:17:50 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 12 May 2022 09:17:38 +0200
Message-ID: <20220512071738.741406-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512071738.741406-1-patrice.chotard@foss.st.com>
References: <20220512071738.741406-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-12_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v1 2/2] spi: stm32_qspi: Remove SR_BUSY bit
	check before sending command
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

Waiting for SR_BUSY bit when receiving a new command is not needed.
SR_BUSY bit is already managed in the previous command treatment.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

 drivers/spi/stm32_qspi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
index 3c8faecb54..ceba413727 100644
--- a/drivers/spi/stm32_qspi.c
+++ b/drivers/spi/stm32_qspi.c
@@ -255,10 +255,6 @@ static int stm32_qspi_exec_op(struct spi_slave *slave,
 		op->dummy.buswidth, op->data.buswidth,
 		op->addr.val, op->data.nbytes);
 
-	ret = _stm32_qspi_wait_for_not_busy(priv);
-	if (ret)
-		return ret;
-
 	addr_max = op->addr.val + op->data.nbytes + 1;
 
 	if (op->data.dir == SPI_MEM_DATA_IN && op->data.nbytes) {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
