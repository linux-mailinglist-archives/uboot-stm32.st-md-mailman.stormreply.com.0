Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAVWOkTcDWpb4QUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 18:07:32 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF48591798
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 18:07:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61B2CC87ED6;
	Wed, 20 May 2026 16:07:30 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A255C87ED1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 16:07:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAkk894Z/9wh2zgEoFA4aWud1TscQvspKiXw3sehEC8pgpeYe5VFZyH8dKabGf+qBSJ3riqfMJZ5Qf6wbOyspx/ZT6RmAolJs/TlVUwneVl5KEg2k7iTbEI2GnIrGXu3NQzCxZ1ciY0yC8T8rWuDaVws0UpL619twGzwCe8ln/6xosbY5kOEU1slF8PeOSXfn8dPLrnpjPV5l6atF01Di0y7umNOnpBm8UyMUG7kmWP6orhh5cbPIvzk9StaIJea8B+/TJrqnAe3yGPSFAiVuVjTaRh9BY9No5ya7cOCrSzM1+RCFv22XkUTZiN+RgCO3H37csoj4dXqvT63icg6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZqqfm6MRoqNhJSSMa0A3sN625H3xi2OU6khIg+ZBsA=;
 b=CgYn8CFpKeZYU7Lzo6Hz+0Pls8aHeqARp+3cqOjA3zkuV6//TWd2WYgvzNVPbQFAWbWQrVTUNFLxeqXXnKnE0bsbTP52fdR/uB5pQ27X077FOMUD1GU8cQpnl85GQbbgogZbaWPS4l5F/Lox6601fpznJBDLLr6WRgiYlX/tnrwTrAEIdu46E13EdnpbNS8A7awJD6vQzMSnFxAejhGoJSdAly1DJCaHKaSkyBpPI3qaxJSPVmz/8poz0YMuX9auF9/8Je71oFcjgYKU7aRExfFFh2Tb8POpvABpOSFh5GIKvMZO/Nt0w4lzevqQjOxsRsVHaAKK2BqMiXl8K9wbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZqqfm6MRoqNhJSSMa0A3sN625H3xi2OU6khIg+ZBsA=;
 b=GsMefkZ4RCTtXMOnRq4aGVAOOunow7BnZzn67t7StKDNMzZSC26vg39I62LdhJPLZlO4BIs0SmmX0t6MlkwlpppPA2d1nZSZTi/djBSCeylPn+nENsuIPrUIhtiY4HBQVKZ0aHhEooxT7WNFtT8IicaBpRJo2dm4FKrO8w8MvjuckvYXsyOhJRptQWJcfszR8q9/WJnRFS/dRsuqPknt44LupJ4KpMOgBKNxhYaFtNXhTi1dFr5S/guk9ho2vqu7d30ImcZFVGjqUQj4KVbg4AYw+uFQLCUSYcn9LaQ0fLvBP7NRgItgk11reCH8yt2lyvhPGKtSixikFmoYvaKZ3g==
Received: from AM0PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::24)
 by AM9PR10MB4087.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 16:07:26 +0000
Received: from AMS1EPF0000008E.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::e2) by AM0PR10CA0014.outlook.office365.com
 (2603:10a6:208:17c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Wed, 20
 May 2026 16:07:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000008E.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 16:07:24 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 18:10:53 +0200
Received: from localhost (10.252.1.215) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 18:07:23 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 May 2026 18:07:14 +0200
Message-ID: <20260520160715.175032-3-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520160715.175032-1-yann.gautier@foss.st.com>
References: <20260520160715.175032-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.1.215]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008E:EE_|AM9PR10MB4087:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d1016a-ca02-4464-b3a9-08deb689e1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 6uAqpWpyQmd2weVqb4PTTNVISNRagAkyA5xqIF2aohQL4Fm3EUYx+yFOsfm1i2ZVcTml9YCaFpjCbEyo0KcWxSQs8R78Hk/pHBPG0oEE1GqwggQuzskZLcTDrOXCt14NnMsACpD5et2qcmkvGCoh4MdR+94f6mmipF7ihI71Sd6If0DdnLYTFd1/ZVUZlStdxvbsGSy9WE//uTwxJ5A1taltT2QRJQu7qjt3KGDBQ2EUBLYLz2CLVz0FK1jSxGRiCqH/wwKuTCpSevJ9sXiHE8hpfyHE/ndnI76UBr3p+B7c2N0pAVcJsW2srmhwCDr31YijYY9HpeLSrzvgfbWU5CC96Fwa/b2XnIrV1HPNuqUvEUnJW+Qgs64I7LXFYnrRrWN7yhjUi9j6kizJ0CG5jly5dwa8wQDpxfdnOtjCi9coIhknkbrRSlCA7aAHtdu6cn9zgP6ZTBrYM/WWFTBaLYsjgT/4BFpIqhCS6+t6dY6aJz5bjI3NWAQtw38GpLKpASl1++0xwpCew0YKGFYMKqJVNtAxckw1E3cD9/7soR01GNqcghXwQLpamS0RamebyF668n269zxAbcnwprQhzxv7hCXpo7r3ohApBfpvPsSXZ/NSHeGuXGXGEGWFTxXJs1sEciIvt/AqoltSBF9kXH3P17+HKELYDR5jHz0XVsTxmKqWplGyy3V10mooYCXd9EISn5NqnqEDCsvTQkDzzPcYtgKeUFnSpBhCMO5UQmA=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QvJTaaAoEZp3rasjh12jJ0e90aqhvlI+ZXZDN8hlVyl2e87oiE1z/ufkB8HjxhS8jc7MPlqq0ErglLt9F1zvSN9ElfrEFNDwgUvhhVwvyX56FStxRHasrWHArsYHAPfKF5N8iYLk8jKqypDiErzHTCqXwWagyg9BP9eXcs2tjK3jRULfvft23JsZRgipcjiqs8PFtaqQGQXp2726xQ3CRBomkg+JAXONi4QyEkLRN0QG7wWkjVqZlXcr0EslBsCGX9F4Y9ZmQTGd2MhsgzBQn0m52zQIoFl/Bm7/UvEELUA32q5UopR2M1k+/kerv6uQndbycYk1kCLGWl/iu65EQRXCGbXM37XzMaaN7IzAgV2Be+qUd2k47yedv+6FghOYCbm9KBRDi5+6eC30lu6aMgmHCAjz/zSg3YFxKxE88B7v8yq/1cCpS9cqMHT4Obi8
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:07:24.7022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d1016a-ca02-4464-b3a9-08deb689e1c6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4087
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Anshul Dalal <anshuld@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v3 2/3] configs: stm32mp13: activate watchdog
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:anshuld@ti.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,foss.st.com:mid,stormreply.com:url,stormreply.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ABF48591798
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

No watchdog was enabled for STM32MP13 platform. Add the required flags to
support it. As done for STM32MP15 (in SCMI config) and STM32MP2x, we use
the Arm SMC watchdog. The required nodes were already present in Linux
imported DT files (stm32mp13.dtsi & stm32mp135f-dk.dts).
To enable this SMC watchdog on other platforms based on STM32MP13, check
that both the following flags are enabled in the dedicated config file:
CONFIG_WDT=y
CONFIG_WDT_ARM_SMC=y
And that there is a node in Linux board DT that enables the feature, as
it is done in stm32mp135f-dk.dts:
&arm_wdt {
	timeout-sec = <32>;
	status = "okay";
};

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>

---

Changes in v3:
- remove CONFIG_WDT_STM32MP
- update commit message

Changes in v2:
- update commit message

 configs/stm32mp13_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 620a6da2efe3..2ad57e23e445 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -113,4 +113,6 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_WDT=y
+CONFIG_WDT_ARM_SMC=y
 CONFIG_ERRNO_STR=y
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
