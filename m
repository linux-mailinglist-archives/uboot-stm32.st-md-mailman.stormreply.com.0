Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL73DVsaDGrrVwUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 10:07:55 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC06579ACD
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 10:07:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB429C8F298;
	Tue, 19 May 2026 08:07:53 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011030.outbound.protection.outlook.com
 [40.107.130.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14045C8F294
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 08:07:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpWenxn3CvkYRAHUiKu8J6FPz475ywbsAvJATfg2xk2j14nYzm70ZI8iVJ/39/x4bJ/aHtu8L7BQhNi4ibQYoyiEcmAKpQPZGnxvDCWn1pF80LFBMpk3Ur1RgyLHW6Ua55RP3xTdLnn7sS2OJ8+jUytly4URGTpnEEUmvfKb8ez1/7pb778XvPKU3lYyKoiJpwsMn3185TADMLGbsQrIv8XbYnYibcheaku7mybbPnlvfO8OWHsQA1hMwBMSvM1yhe9csU0kc9jWIdq/FOhr4x0LzdM2QACVO6Nu0TmUAdyNoXW2ssU282soujzZrvBnCLQC1YDv3xWAAtx4X6fGeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgy09R16j8Rclo9IAtw40O62PMbf8qnqoivMQ0bmYEI=;
 b=wkdoU9aQnm3K2nZAEbXGc4jOzSeOiq7sjYpNEs+j4uiUYr9lFYeEyZN6qCdIQEEwfhXznSX/S+2qZtiKpAUpOQOkMeDCUDhy7RTEfxk9ZC7N/m6ljlRQAeTsZdJsP3HdVuD0j5FqXKLJSGY/h6e5yuiHk+vluknwRn41XFX86WjcYgZ5jF35UDpwpnfpGBYb+fRWuw4pjY31hEYdhUAW4Uc6XqEApe66GfvDlBa/+jETsiotLURa5Sp9cXu2y/bJ8uQxGyKWGsjWyOa5iMiYKNmUcrTZAIN5B/f2WmflFUgNsPIA1QFAhuXb4HtX0xQfwXUA+qdN2lu7YYKp8AcVeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgy09R16j8Rclo9IAtw40O62PMbf8qnqoivMQ0bmYEI=;
 b=QDCnclsqlZk3GmI4HEd8qGd74jcqXAI3OhnnVCDZIOdj5o27HC5tkpnloHH2DOVLBdjnnFkkKyiWhTYLgAHe7YiMEFgv7Ec9BCAS+n5qLpiu5XB5RSQgD5S0BMqndbDyBt8vogfFqXsmPndNxNDdMtLfAvwAngNqIzfLRaNonGXkWToQyjBEm/8PVZQBE05vXYl2sGAlXOqnpSi4TIpD/FQVwZEZzqP5DsQWiTn0PU39JiaI7CfasmEElDnnqds7rOVM3Ru7mHdcpjaILaFc72os1gaCKUnoL5REv/xxSV6yHMEHN4QaxJEtsAQKmVvZe+n1oAORjfEFtVlJhzeEqQ==
Received: from DU7P189CA0027.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::22)
 by VI0PR10MB9695.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:33a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 08:07:48 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::36) by DU7P189CA0027.outlook.office365.com
 (2603:10a6:10:552::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 08:07:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 19 May 2026 08:07:48 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 10:11:40 +0200
Received: from localhost (10.252.30.192) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 10:07:46 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 19 May 2026 10:07:36 +0200
Message-ID: <20260519080737.47928-3-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519080737.47928-1-yann.gautier@foss.st.com>
References: <20260519080737.47928-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.30.192]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|VI0PR10MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e55af3e-e1d8-4a1d-c6ca-08deb57db726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: ox/elFc42q9/g3XHomUGVvjd44mCgNw5LfajUP+qx2uZfRe/GBB63Sxv50C54mBICymOlvM5Memni3Gvc4p5OhncZXW9W7uv5gFCHRhxXxxOWlPCsoOZEutr5BW3QZxqQQ5Pk3bdpk1KlU6ZuT5azTweeTJjxu8VAri+PDWjOsOIzI/sTGvYWRD4fY8kLNFD5CsSX61WPI2GbEySatgVjO5EUFHatKc/m4m9G4O0A9I9yE7jSmkIvsVG1FRtJlxJYmOmRduEHg1QBXUGJjnU+6NVvtBcPuSmwVgA9idZC1yAtxoRvnSir9Hh6Q7V6kTtBGmVoBSempOA9F1pVWme8aduFwNU5kqor5BwOv/s/ECHToM3mrUk7aFUe/zgFKT4UzVlkifPOGRA1x8X5rl0quUC4avHKMcZxhjIAu8f7QXzCgVEypOZYo3BInKKRoFdZlAUTj5LZ+Cl4szOUaNDfzrixBY20Nofty0e/ELbtNfhOD/9IHZq+f4Uve3jMGGclNJ5SR8ReztWvBRUxnuGFbLYisduTh7KBU42aYMb9fN6EZ0/F8hpy4JOA1ps5Q+D/PArOw3RVQTmvrFGEjiIU/TMHvYqwZMErKa45a13xZQZ9es1IRnIh/iyg5eOV9X/VuYOgniS7n5nCAiTWASCC9xVCHhStKI/f4IjwWU6gOAvbSB1z0UZO5tvInrSPH7K18XogNHSOAUfAWJrso9i2i3XkMf8EJj3WINKen+XAgI=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(11063799003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fz7mmlllhgho7Y98gdl33gi/f8K3Vplw8L+inZDv2Z/NE/U932jd4FP9JgnWMO99Bh0YHbzVw3OMkG+NSTolBG4gTSqi+uv4k9UT19CydVLwGKcxzqdfpx7Drmlon272kEWlsLpLUabi3jr7AIQ555cJwB/S3wpBSbVIgNumHhwGV7mB1wwk2+jiCsQSS1lJ30XbhNrctjUghcEcbwHIswbZL+TSyFdJtsF++Vtunw2jR85mcJqOZmYU8Yh9vU9iazrxfnI4T2B7SLv9rOvqVQnHoeoVbzL/zsKVThP4D+BUIHuvIzsBdbtxkcDvOB6a7a0PG80O+toFoMP9zfEhDWSxYKJoZ2B/N8Me0YPRgo7tvvxeRSm+mMBXikjxoTKUYQcft8E2uWmqhmUoAn/aUWdrneMSCXF399kj6/23zg8qizEgK72sciaMVatXvfLW
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:07:48.0389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e55af3e-e1d8-4a1d-c6ca-08deb57db726
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9695
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/3] configs: stm32mp13: activate watchdog
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECC06579ACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Activate the watchdog for STM32MP13x.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---

 configs/stm32mp13_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 620a6da2efe3..cc41585097c7 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -113,4 +113,7 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
+CONFIG_WDT_ARM_SMC=y
 CONFIG_ERRNO_STR=y
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
