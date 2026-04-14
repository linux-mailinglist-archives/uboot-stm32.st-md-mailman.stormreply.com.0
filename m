Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEO/DPcE3mlRmQkAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2026 11:12:23 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 715D83F7B08
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2026 11:12:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C7C3C8F287;
	Tue, 14 Apr 2026 09:06:59 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C711C8F286
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 09:06:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mvhg7t80q4uDj42hFgDvoO1k83HFxKnoDGTyCKmyrLJ9K0bodC0zvc7MewW7qmmz9HcQruo+JTPW5tdAFCHs8xVFvH7VGRlnHCt8oGxqBpzv9BrNSCndM4IWcG08EzpG8wzMy6eLf/vFm6YwpLWW0j669iQ+JRlJn0+L9iD9n5fn7ooS4pB85kj2DRsqMc+xcOukyDoer3TRPZv68UgsKXg/QgKfqoGocfjvA3sIR+E/Hg0icRm3XYGznSMtqB7HngQuyogrpU2XM8MIhGWCVk/cCbblkcarR6qIh3xkrGViR6gf+3ybqrhH2dwBEFN7PtsFq5ucHyWTg2BMp3WKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPQqIMq6EZjqNVOAL9IxvlHh6PoJjLH+om8aeJIYX+8=;
 b=Hq5jEtlDViIeVpPfvTKYdJgwlaiqC3N0pCbESBF4ABCQ2/h1v1G4ptq6c5SETkRWmphePkLbfXNH3GyaCinHynAc1XujYNlPt8WhS7cWKrcQocz/XxLPCCGgM2ilV5YNhRNI8vejxYY6fpb1HHM65jQy4Y7CCaCaZcsxQ8xqhXqvzKbkeTz8OHUJq4T4V7nI8kC4KZoVhIjWdkedS21VTCg62krRghtMUpbnpm67HqSyXsXuRZMNI/eaqu3o37XOjgSmBbBmQpY6aDhdU+13dPLZy5ATnpOLJZlWqy5pt28Vm/SAXEFfD7iitFXkNVcSqzyeqEipZ13cV59vis909Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPQqIMq6EZjqNVOAL9IxvlHh6PoJjLH+om8aeJIYX+8=;
 b=ZUj9GJh2tN2oMdjaL7gvNfCNw37lZWrRpbsSGikM3PmIJ11h7T4Ybnc2308DrzYPTi+jzWhda381knCqwq1aef03LF/qJIO2Kv8jlxbzY/V34IMKf0+JuoMjciUGXcPHwwNYwHrLXUzrCMQiIt62K3o57pPioDE8Z0e4QBoHYsi0gYBOudwON0Fdsk1JNZAAs4Kxz0uV9jUwSrI1OrhVEKaTi2hHF9xBTRj2eDUJdtur61KDbrKDE6B8wCCDihUlEVRWgoA1Gm8136Z2bUOxVc3GXh4hlmDlVpp7e7WmPtmdealSeTTVdSKkpB0Txayb9Ocw55nWk5fEP98F6BfVcQ==
Received: from CWLP265CA0517.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::18)
 by PAVPR10MB6791.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 09:06:55 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:400:18c:cafe::d4) by CWLP265CA0517.outlook.office365.com
 (2603:10a6:400:18c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 09:06:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 09:06:55 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 11:10:03 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 11:06:54 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 14 Apr 2026 11:06:50 +0200
MIME-Version: 1.0
Message-ID: <20260414-fix_usb_adc_meausurement-v1-1-8cdbd4c10dd8@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAKkD3mkC/x2MQQqDMBQFryJ/3YBK0OhVpIQkPtu/MEp+UwrBu
 ze4HJiZQoLEEJqbQglfFj5ihe7RUHi7+ILitTL1bT+0utNq45/N4q1bg93hsuSEHfGjoDH5cTI
 mBE81PxOqe6+X53X9ARH1lCBqAAAA
X-Change-ID: 20260414-fix_usb_adc_meausurement-e4e9b7988ccb
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9E:EE_|PAVPR10MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: d6bddc44-4cb0-4a49-69bb-08de9a052ce1
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: cH+ajMEsZn/FdoYEeGgueyLfm63cymK2tOA20E05/mx/QulAKhb6uENuzP3SjPyvCb83ba6vBAMEV5xFiQg5LKB6HyaFqK1wqE2qma+rL3zY9VLaH9HgkCn/TgWpHxhGuO9sZgBklGL/LB4YlHuVsKm1U11L7hbk3U9v/32vxP3v/Jg6UbERPFLotTnGrKmIwIT1iiZHJxxl7rFsI0kV/aJXnniSjzQGyXp7rdwUepZTYN0nWDlzcflLV3sV2mopDsxNwFwsBY+T802iIzwDlnkgx7ZVPLnsjOUPfTsw4OVK2s/6JMS52Z220T3uoiX8OysNAI7RK4dpeCtP+SqYbVyKXbXIIqqIYDiEvJX+ZCuKT/xFycldnLZaxx7Ua9m/AvD0JDKLg7+KgPNskufVBn/x9sWl60LC7xUUCU8bTtUpcZvsVRAf3/+9cS1kAYjtpA4ila2BfHqRthzrmd5/TZz/CxV7PBQiNj3PVNQeRcz4CG0eqqAoEyasBQQsmDlOOWTIbjPLRu1C1O0R33XoHl73a2dLGZL3fouk5ofP3MWYXthE/reRDpyet3m+2Bjosmpi0Eu/bmWwwm2eoZKZw+jDtVLvCHC4zL9Hn5WBY9x0HB4wzrd8QgP4V1riXBcs26guQYfhCOXZgMFdy3qZpLKcWXoRjvfjfI0a0qWxLWsSmeGsmoIwe3BYpVtyqyCbTYxokkSxV5WhkUs5Co5EOlBZcyO2Tzlf+z8qmgVNAEI6CRbCD+Vx9hekoZFHynr1lWIDiQIFKj2rCGHN4y9ypQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QVRtXIH5QX8cguUWvTNjatWOpyp+t9ZxF3vMYmt/xgr0WWaVk5y8DGR/k+lnTw2hm5cYww8Ex0JlD+kthAaVFKTmuIEka3MTy9o1D+NQTzn3SFWafALWgrSRsXOcUVngirrs7WxnAigaE8/gEdieUOK12QovyPDPy6XsPWJo4e5b0+l0vyF1XkXIHFUEqrz1JUFFmkScFPJ65ayJob/SKqFowB2VMal5F2Y5ZGgcPZjC6FEUPjq64uZITsx+8HaEykA1hnSpr9nMiqFlN+eqvE0mfqtjckbw3Z6AIl2WKhoDwzmL4g4pOOiKyykpbBDnx1IQab0lquwxDWu4NSAYubA/EnR8LNHrLyXEY74lMjTT/BJ5pVDnc8cIV4g9Asdz3HVkXeAZHxiDjtdcNMVRPwG+h2i5kY/rOtTqEszvlAw5DK7/5083QLy6jDRbjOvK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 09:06:55.0785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bddc44-4cb0-4a49-69bb-08de9a052ce1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6791
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kory Maincent <kory.maincent@bootlin.com>
Subject: [Uboot-stm32] [PATCH] board: stm32pm1: Fix board_check_usb_power()
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.183];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 715D83F7B08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Depending of plugged power source (computer, wall charger, ...) it can
happen that we got the following message:

"****************************************************"
"*      USB TYPE-C charger not compliant with       *"
"*                   specification                  *"
"****************************************************"
"                                                    "
"### ERROR ### Please RESET the board ###            "

This issue has been detected on STM32MP135f-DK board.

It's due to max_uV and min_uV value are initialized at beginning of
board_check_usb_power() and can then be used for the 2 iteration of
adc_measurement().
max_uV/min_uV values issued of the first adc_measurement() iteration
are used as input of the second adc_measurement() iteration, which
can lead to incoherent pair of min_uV/max_uV values.

To ensure that adc_measurement() returns coherent value for max_uV and
min_uV, initialize max_uV and min_uV at each loop start.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 board/st/stm32mp1/stm32mp1.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 5f7c6822116..88ede4e3910 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -326,8 +326,8 @@ static int adc_measurement(ofnode node, int adc_count, int *min_uV, int *max_uV)
 static int board_check_usb_power(void)
 {
 	ofnode node;
-	int max_uV = 0;
-	int min_uV = USB_START_HIGH_THRESHOLD_UV;
+	int max_uV;
+	int min_uV;
 	int adc_count, ret;
 	u32 nb_blink;
 	u8 i;
@@ -358,6 +358,9 @@ static int board_check_usb_power(void)
 
 	/* perform maximum of 2 ADC measurements to detect power supply current */
 	for (i = 0; i < 2; i++) {
+		max_uV = 0;
+		min_uV = USB_START_HIGH_THRESHOLD_UV;
+
 		ret = adc_measurement(node, adc_count, &min_uV, &max_uV);
 		if (ret)
 			return ret;

---
base-commit: 88dc2788777babfd6322fa655df549a019aa1e69
change-id: 20260414-fix_usb_adc_meausurement-e4e9b7988ccb

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
