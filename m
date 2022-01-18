Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C414E4922CE
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jan 2022 10:33:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 774A1C57B6C;
	Tue, 18 Jan 2022 09:33:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85210C06F81
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jan 2022 09:33:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20I7b62P002926;
 Tue, 18 Jan 2022 10:33:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=WDzXm02rdKBW/oSwEsRXwaaOmPJYlINpExQ0xVf6LSY=;
 b=0b5/hXiHhTQNqqQHcph+gcbbLbD1MUpos4Y4N13PCzDoQSrInvGrk+GEJG652rPUoL4a
 WnNf2lUHXNWfVdlxe2QMpf9wudNN2dX1VEKVYlDi+XQNAXlI/8D0YQ2LyhTqaz9cL8aM
 Z6XzWPTebQ+3jOApXR35TBYfn1PVZBO2Ti/02gHWpkm9QFn6Tetg0RIlTUqbLE8xScKz
 5bKOEsPgrdn9odt0rmgk4/UKXyTsR4WYr0GnCZj8rGaxGYEtJLARheDd7eFntYKm5oH+
 yhBV1xDKCZaF24V2VPGsoqUT9Dw6OUojBQ3o6R+s/vliFagiZmfbSK812tjPg7AXnmj1 Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dnsaq0p2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 10:33:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63A5110002A;
 Tue, 18 Jan 2022 10:33:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5CD1C20FA4F;
 Tue, 18 Jan 2022 10:33:30 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 18 Jan 2022 10:33:29
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 Jan 2022 10:33:14 +0100
Message-ID: <20220118103311.1.Ic9dd7501d7e1e832827438c6a94605cdfdb17f0b@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_02,2022-01-14_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH] stm32prog: add partition name in
	treat_partition_list error messages
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

Add the partition name and remove the line number in error messages
of treat_partition_list() to provide correct information to user of
STM32CubeProgrammer.

The "line number" value was confusing because it is incorrect here;
the index in  part_array[] is not aligned with the line number in
the parsed Layout file, because the empty lines and the lines beginning
by '#' are skipped during the first parsing in parse_flash_layout().

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 3b6ca4e773..61cba157fd 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -835,8 +835,8 @@ static int treat_partition_list(struct stm32prog_data *data)
 		/* skip partition with IP="none" */
 		if (part->target == STM32PROG_NONE) {
 			if (IS_SELECT(part)) {
-				stm32prog_err("Layout: selected none phase = 0x%x",
-					      part->id);
+				stm32prog_err("Layout: selected none phase = 0x%x for part %s",
+					      part->id, part->name);
 				return -EINVAL;
 			}
 			continue;
@@ -844,14 +844,14 @@ static int treat_partition_list(struct stm32prog_data *data)
 
 		if (part->id == PHASE_FLASHLAYOUT ||
 		    part->id > PHASE_LAST_USER) {
-			stm32prog_err("Layout: invalid phase = 0x%x",
-				      part->id);
+			stm32prog_err("Layout: invalid phase = 0x%x for part %s",
+				      part->id, part->name);
 			return -EINVAL;
 		}
 		for (j = i + 1; j < data->part_nb; j++) {
 			if (part->id == data->part_array[j].id) {
-				stm32prog_err("Layout: duplicated phase 0x%x at line %d and %d",
-					      part->id, i, j);
+				stm32prog_err("Layout: duplicated phase 0x%x for part %s and %s",
+					      part->id, part->name, data->part_array[j].name);
 				return -EINVAL;
 			}
 		}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
