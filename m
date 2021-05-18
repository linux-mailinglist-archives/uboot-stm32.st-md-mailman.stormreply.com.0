Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5171438799D
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:12:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AABFC58D7F;
	Tue, 18 May 2021 13:12:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 303FDC57B5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:12:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ID6mrQ016921; Tue, 18 May 2021 15:12:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=bBE85X2BH7KI6PjO4FsKZMmG2qNyA7aXP7H+9om+WOY=;
 b=rbzJUUPxzEuLkYNJ7ylNMkWe47Lb77azl4cakXC0QEwxp7bcVQFT7Q3pHhznrdNVk4ym
 XlhDl6tMyq0acFYl6LnDdWBNEU59P4vhT5OMmGFIIRubVuSkUXLB9+Xul7Zy+piSWlVu
 /0f/usvUY1XiUYD0h3VF9Nv7T7wL8J5Fq2YJ1jv5/wvn/gLA8rFL4joNY/QJLChmKFE/
 YR//3U5XpiCMq6dXCPYg7oeTrDdk7+7NcM9jw1WbkEyEPkQy/WaYzciQ/Z/jQJuHd0ic
 2lv/GmT0OWF/AXFzcfmq2uz0mzgqSUYTDIEXUOGFTYMv1J/22UaDIvVCuE430dX9dqk1 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38mda9gcar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:12:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7067E10003A;
 Tue, 18 May 2021 15:12:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65E782275E1;
 Tue, 18 May 2021 15:12:18 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:12:17
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 May 2021 15:12:05 +0200
Message-ID: <20210518151206.2.I11b3c3f4cdfbecc6830d6280ba993c8ba2ba0eeb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 02/10] stm32mp: stm32prog: add timeout in
	stm32prog_serial_get_buffer
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

Handle timeout in stm32prog_serial_get_buffer to sent NACK
to STM32CubeProgrammer when the buffer is not fully received.

This patch avoids to reach the STM32CubeProgrammer timeout and
the associated unrecoverable error.

  Timeout error occurred while waiting for acknowledgment.

  Error: Write Operation fails at packet number 4165 at address 0x1044FF

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 .../mach-stm32mp/cmd_stm32prog/stm32prog_serial.c    | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
index 7eca86c11b..2550ae6a2b 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
@@ -60,6 +60,9 @@ const u8 cmd_id[] = {
 
 #define NB_CMD sizeof(cmd_id)
 
+/* with 115200 bauds, 20 ms allow to receive the 256 bytes buffer */
+#define TIMEOUT_SERIAL_BUFFER	30
+
 /* DFU support for serial *********************************************/
 static struct dfu_entity *stm32prog_get_entity(struct stm32prog_data *data)
 {
@@ -264,6 +267,7 @@ static bool stm32prog_serial_get_buffer(u8 *buffer, u32 *count)
 {
 	struct dm_serial_ops *ops = serial_get_ops(down_serial_dev);
 	int err;
+	ulong start = get_timer(0);
 
 	do {
 		err = ops->getc(down_serial_dev);
@@ -273,6 +277,10 @@ static bool stm32prog_serial_get_buffer(u8 *buffer, u32 *count)
 		} else if (err == -EAGAIN) {
 			ctrlc();
 			WATCHDOG_RESET();
+			if (get_timer(start) > TIMEOUT_SERIAL_BUFFER) {
+				err = -ETIMEDOUT;
+				break;
+			}
 		} else {
 			break;
 		}
@@ -648,7 +656,7 @@ static void download_command(struct stm32prog_data *data)
 		printf("transmission error on packet %d, byte %d\n",
 		       packet_number, codesize - counter);
 		/* waiting end of packet before flush & NACK */
-		mdelay(30);
+		mdelay(TIMEOUT_SERIAL_BUFFER);
 		data->packet_number--;
 		result = NACK_BYTE;
 		goto end;
@@ -666,7 +674,7 @@ static void download_command(struct stm32prog_data *data)
 		/* wait to be sure that all data are received
 		 * in the FIFO before flush
 		 */
-		mdelay(30);
+		mdelay(TIMEOUT_SERIAL_BUFFER);
 		data->packet_number--;
 		result = NACK_BYTE;
 		goto end;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
