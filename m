Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLt1D2tdDWpuwgUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 09:06:19 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B5588A4A
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 09:06:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 253DEC87ED1;
	Wed, 20 May 2026 07:06:18 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 595A1C36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 07:06:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iI39XxOUDHw+q7fLD977b/9/NopFXJ552xSky7fTtOIvmtXGvSpmHZl/LnNWK372wXs3pL+biZxCClzT1+elu3YDusbtRwPRfQRCm4tzEjEZjkyaaX04eUQTX4KsobcMqONf5HYNJeAIEgqzsuMeTXqAEm+mO3dicbJ30qDQ6lMdxRdyh3Z2iQmCFlgJ+DLdEc4F7ykhyv2E1Rg1X03xL4lLKbVugD35S4iJ1/E7L2KJzevPbNOEK0KwnXq6QSvcG9xWFNIxzOIPLoNu7f4M+j7+ZTOsEhvClylJ4m23qMtQDRYoxYocfnggz0AHaUBXsN9z2HefDBnWngzBOzI5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVvVeKYlxsN3dKKOXT4/EVSgKkCEyZ5olFGd7VnOXxk=;
 b=ncv9y+XkflwL6XOOIJovX9xbrDAC3J9JeIjzfuVvmn8kjwzr2srAS7Cuvz+BN/T1mZFLoSHQxprCROj1nOYynVDLy3wURNbMlwSBQ+gaWlr/HkZJrz4ttcFeZUKW3Qb+/gsl1kWCKRS/6Fm0kEoi+SEtRD6Re+Oo1CGrC7uFnjGxiwJ2Co6EXp3Z4DtPZY5I4Tlo7AhllA6KvyZDJaAbshr7RnB9UOrfBrrX6BNkNCuYcRQxgw9Nm2UyJrmJj4IGIcq1i0b4z2AIDGAQTCoWWh6s+4piQxg1y98Sn0nRbTc+AOerdoPkHzhjhkK55SlUtmKxjfUTh470AvRskj9L7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVvVeKYlxsN3dKKOXT4/EVSgKkCEyZ5olFGd7VnOXxk=;
 b=UAoMn7Zu2SIcnl6Q44qoCfIs+A/M044sqYW0XcfT+DiRHrJKAAANA02w1b8k1YhtUF6WBz5NrRC4pZv92F9z6h06g0PCla6ldHKJUmZHvBLodxEiDS6bRtmRKrxMtgBoAMWjL0Jnc9K5+84MrI1IxvmOb9qL32QufPiGj5TuwpMtpX7u875W/5cV8EQcHDuVvEEjBv19Qlyj9qSbiy63igjj9frANUtOn/uOxOle/Uzth83ut6xjaX0ywarH4JyHcc8mgW+VMUmlmzVNCRrOaSvWajhRksB81qekkSO0Mnufu6BQaxRYCfuAFuE79tLnXgagxz4eLK9xWSDvGMmatw==
Received: from DU2PR04CA0313.eurprd04.prod.outlook.com (2603:10a6:10:2b5::18)
 by DU0PR10MB7530.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:425::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 07:06:10 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::89) by DU2PR04CA0313.outlook.office365.com
 (2603:10a6:10:2b5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 07:06:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 20 May 2026 07:06:10 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 09:09:39 +0200
Received: from [10.252.1.215] (10.252.1.215) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 09:06:09 +0200
Message-ID: <66c7a3db-c134-4afb-9785-cde11852f8b1@foss.st.com>
Date: Wed, 20 May 2026 09:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20260519163145.221668-1-yann.gautier@foss.st.com>
 <20260519163145.221668-2-yann.gautier@foss.st.com>
 <990e5ee3-75c7-430d-985f-f146ca8d265d@mailbox.org>
Content-Language: en-US, fr
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <990e5ee3-75c7-430d-985f-f146ca8d265d@mailbox.org>
X-Originating-IP: [10.252.1.215]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|DU0PR10MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 98686937-1120-47f1-42a2-08deb63e458e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|22082099003|56012099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: EJIVI42oqNcVWsEa57Xkkf68OMUf+RRMSVYdXQwynVYbrSX3lo1KO61S23i1KPPiXaRHPwupmpCGvTUncEhbGhUx6cOGJYNa+ke8ITPA9n36bygJ+eQ4111reqT556ParvGhOk7FqKswdDyQgE5O89btcLPjvk88M4Hh6PyvcmKK5YiJ2oLEQ7xrGvh1+7ue3m7GYNXCx15yUWcEtQQezPLqD0xSF+Q+gmNEpNaPf0Vuqo7EqK9bjEezkUrNE5A6pMbI57FJ5jlQy+4at0JR7lWpaDfh5yJei2D3pJ/8CDCqaJiGTMCzEjmrayang6v1vPRDcZS+P226VdMysnuAqa1KRhmLyPamYcXoZYo3hTUAH4UzvN4T/6cYD7u3JnBPqM6KcvAt+CARX2+hBQ9rIEfMCazH/+ZEo4HlKl2oIVEwTE3pWFc6/vQ43MLMeuwz03JMMuuvfJ03lIVHGNb3j1fmTAgNtx6gly3o/R/1T2XyoGPNXfg2vthWXLVchYe63nyDXNbPfqBgshbXwBKwOGAJOBETIEg/Gmf6J4EV6Zok3zk7B2gsunoMOnbk4uWaURd0BYkgxaNgNgt9M6LarlHgGMB0z66tSy3i/aHSsK7eGr1pl3FjN8ju6li4PRteiCa0rRaAn0ggqc5WRyC39G9+lxKbfjJwtVC8Sr2e309/nc0N3txuTbZwex9roRgRxNE40BzGtrdHtD7UFxVDtFsWrgqUwNeL4J9cCtWtD6I=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(56012099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IyCAgy9Uh8dGHZR/TZNxbyNVr2vljWnMfwNjNHbN39+Vvmb79g3K2wFptwaFinDr3GBGFVmIGe3SVRM7Ieqf2XOmWTvOMIu6Zk5/atGP3DuTpq+mNW9jPmc9/tac6RYBbyactdkcQ2oAaUPRPvw26s8tOEjYMn11WK2Ke96A654r7/PEMT5AgsqGzFuw0G7uQJ9oaoMc+qlvE1i8EjhbgyKdPP9Zrb9K1CljN5JLS6e5pkMH3r7Bm2xhkSqGQS51ta/8NTGzhdTKs37obCimPm+J1ufJKmf18Txg0e5SP2kPQep6GXxuj6rw4qwqcMbvOVsS8iptGoKPE+pwd+YckldoKM8Eg87Ll0QrDnkpvPok/fz9JZvvp8MFAC8H3sfdIwjYB02EPthfLXqyQ265P93MZ0uK7VTumBXG3wsPro8tL9FsXI84m9F0aDw4vMuT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:06:10.3281 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98686937-1120-47f1-42a2-08deb63e458e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7530
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Peng Fan <peng.fan@nxp.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anshul Dalal <anshuld@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] configs: stm32: enable WDT_ARM_SMC
	driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:christophe.kerello@foss.st.com,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:anshuld@ti.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lionel.debieve@foss.st.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,foss.st.com:mid,st.com:email,st-md-mailman.stormreply.com:rdns];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC6B5588A4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 18:53, Marek Vasut wrote:
> On 5/19/26 6:31 PM, Yann Gautier wrote:
> 
> Subject tags should be:
> 
> configs: stm32mp15: ...
> 
> to avoid confusion with "configs: stm32mp13:" .
> 
>> From: Lionel Debieve <lionel.debieve@foss.st.com>
>>
>> Enable the arm watchdog over SMC driver.
> Commit message could use extension here too.

Acknowledged.

Best regards,
Yann
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
