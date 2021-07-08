Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3111F3BF765
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jul 2021 11:17:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9D40C597AA;
	Thu,  8 Jul 2021 09:17:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C73D0C59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jul 2021 09:17:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1689CqrK007124; Thu, 8 Jul 2021 11:17:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=uTPgOboWDGBiM9+5MRwGuagMPu0aA9RCCJlk1WnpYIk=;
 b=zu1KMnrBJzDMBgUlbB1aUhjO5NwI5QMcd905206dDpj9CQm2CtyGnjIjELhAXYTq60gk
 tFJ0II+sxYI9ClYFhtR9o/D1juEZysdL53IgdcCF7LGW5Xr/oOAd++oag3FFcp2CvsrD
 WNw9rBVHTeneAVtj9QpiMku0G3ZSkVH78l0IT+7AiN06I+xIMq7m+N37Gst+woFGuhj9
 1sLEo88wympgEGS2CGklkCo3pZvTRmJb7UZjZ3dSI34/wogfWK7y5Usq04YlQLRruAKQ
 bIpqjmBFcFr0m1OPzZPCX/ZQK6n2teRzjVFUxqlv1b9GykOeD0b66QiZAWmHvzUzr49W 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39npqd2pg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 11:17:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7EBB2100038;
 Thu,  8 Jul 2021 11:17:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 723F021812E;
 Thu,  8 Jul 2021 11:17:53 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Jul 2021 11:17:53
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jul 2021 11:17:47 +0200
Message-ID: <20210708111743.5.I1aeda5b6cc2115de802f79656884387d7a7ca94c@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708091747.317500-1-patrick.delaunay@foss.st.com>
References: <20210708091747.317500-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_04:2021-07-06,
 2021-07-08 signatures=0
Cc: Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 5/5] stm32mp1: stm32prog: remove
	stm32prog_get_tee_partitions with FIP
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

The MTD tee partitions used to save the OP-TEE binary are needed when
TF-A doesn't use the FIP container to load binaries.

This patch puts under CONFIG_STM32MP15x_STM32IMAGE flag the associated
code in U-Boot binary and prepare the code cleanup when
CONFIG_STM32MP15x_STM32IMAGE support will be removed after TF-A migration
to FIP support.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c | 2 ++
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c     | 4 ++++
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h     | 2 ++
 arch/arm/mach-stm32mp/include/mach/stm32prog.h      | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index e36501a86b..821c174bbe 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -175,6 +175,7 @@ U_BOOT_CMD(stm32prog, 5, 0, do_stm32prog,
 	   "<size> = size of flashlayout\n"
 );
 
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
 bool stm32prog_get_tee_partitions(void)
 {
 	if (stm32prog_data)
@@ -182,6 +183,7 @@ bool stm32prog_get_tee_partitions(void)
 
 	return false;
 }
+#endif
 
 bool stm32prog_get_fsbl_nor(void)
 {
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 4c4d8a7a69..2fb1f1f24a 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -823,7 +823,9 @@ static int treat_partition_list(struct stm32prog_data *data)
 		INIT_LIST_HEAD(&data->dev[j].part_list);
 	}
 
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
 	data->tee_detected = false;
+#endif
 	data->fsbl_nor_detected = false;
 	for (i = 0; i < data->part_nb; i++) {
 		part = &data->part_array[i];
@@ -877,10 +879,12 @@ static int treat_partition_list(struct stm32prog_data *data)
 			/* fallthrough */
 		case STM32PROG_NAND:
 		case STM32PROG_SPI_NAND:
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
 			if (!data->tee_detected &&
 			    !strncmp(part->name, "tee", 3))
 				data->tee_detected = true;
 			break;
+#endif
 		default:
 			break;
 		}
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 581b10d0ac..5b18f2fd4f 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -121,7 +121,9 @@ struct stm32prog_data {
 	struct stm32prog_dev_t	dev[STM32PROG_MAX_DEV];	/* array of device */
 	int			part_nb;	/* nb of partition */
 	struct stm32prog_part_t	*part_array;	/* array of partition */
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
 	bool			tee_detected;
+#endif
 	bool			fsbl_nor_detected;
 
 	/* command internal information */
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32prog.h b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
index c080b9cc42..99be4e1d65 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32prog.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
@@ -11,6 +11,8 @@ int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
 			       void *buf, long *len);
 int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size);
 
+#ifdef CONFIG_STM32MP15x_STM32IMAGE
 bool stm32prog_get_tee_partitions(void);
+#endif
 
 bool stm32prog_get_fsbl_nor(void);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
