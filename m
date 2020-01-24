Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A5D14855C
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 13:46:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 858ECC36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 12:46:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6046C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 12:46:00 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OCgbPu010527; Fri, 24 Jan 2020 13:45:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=udjV2bl9BCuvfuVWBnMYGyUeVynoOXmJclXnhc5TdEs=;
 b=twzt9CgQgMjCEbokCBXUPBHp+Z3iM6QANy2EPZctpd3Rtb+3NcRtbThUYey6zvrGHQJO
 F0tWuRMEUIsxhxjReQUDhPbo7mc5r3usj+rY6iinWcteeD5ow5+00sUZCfPgTNjfjPT9
 Xk32v8EzZ1DdSTRPuemdbN+BblPDa8RE77e9BGjWQIHMy6mfyNcyvXiVOnFCCJ3VlmyD
 CwzaYrrCCuAx8aXpZtmaCxh27CdlnPHxWLQgJNXWgpu4PxF0b8qaG4lPGpGA7sEdvYng
 jCl+8lOpTpvrW7tEL6zLxF7UWzalTey4iYGujwkohCv/9D3zQ4tGo8IZHTHlEIxBqzQw lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrp2qwmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2020 13:45:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12731100034;
 Fri, 24 Jan 2020 13:45:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A7792A7710;
 Fri, 24 Jan 2020 13:45:59 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Jan 2020 13:45:58 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Jan 2020 13:45:56 +0100
Message-ID: <20200124124556.2563-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_03:2020-01-24,
 2020-01-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] mtd: add prototypes for weak function
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

This patch adds a prototype for the weak function
board_mtdparts_default().

It solves one warning when compiling with W=1 on stm32mp1 board:

board/st/stm32mp1/stm32mp1.c:
     warning: no previous prototype for 'board_mtdparts_default'
              [-Wmissing-prototypes]
     void board_mtdparts_default(const char **mtdids,
                                 const char **mtdparts)
          ^~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/mtd.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/mtd.h b/include/mtd.h
index 65fcd3c700..b0f8693386 100644
--- a/include/mtd.h
+++ b/include/mtd.h
@@ -11,4 +11,6 @@
 int mtd_probe(struct udevice *dev);
 int mtd_probe_devices(void);
 
+void board_mtdparts_default(const char **mtdids, const char **mtdparts);
+
 #endif	/* _MTD_H_ */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
