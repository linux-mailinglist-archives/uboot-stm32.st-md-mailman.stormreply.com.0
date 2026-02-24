Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKF3JZXgnWnpSQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 18:32:05 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2311418A8D7
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 18:32:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6E7BC8F28A;
	Tue, 24 Feb 2026 17:32:04 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7A6BC8F285
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 17:32:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehgh+RpP5HXKyqiJij90Xwol78OdHYErfVowWNM+Slw4Mw2kmuuw6aK+mD+lFv0ibmLumwP4m0BKi3ao0xVTROYOIQETN1TeJtQFCyAVQzasrDNbgWbAPS0eurpjFFCip9Qh13z9Pu1ityRG6wTnieua32rMb2uB7HLwlyqZRsuNWDRG5OQkNTZJHQ18mXBss8GneoWkJphhEbk4dpAJCru4nFJP/VVq8ZvilKaJhk4wIjuIu3I7UbOGUta2RfBj0es9JoiPHrs3+McBJkDs6biJjNbYIFTRYpwbLhr4f6H39j4w+12H0jyUswTpvjCubaiDFj1puvnd0HrCZf9l/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhaCrHTgVWzWwnFoEnUfJYJ93/o94xT0fHU+KNPtfdc=;
 b=YYZqDhfobtH9PHNGlBKRRcHZM95KHYFnANZzocrrpqdp12OYcXbQAEC57Lp6mecrHGd0ZSrkXI/JEp5HLPdxoyTZgmFYIJ6zeaN0qWy3bigjV56g0z6YWkw8PG4SIUInwL0i6K+P5XVPhRPd0iibHmSOQdJAHK4ata5+GaWt8MCdsuOrQsVAXMFXR7dHA9uf96QsjVWKo6RGr6zA5IER50TtkEw5qsNyqqpGReLccLBA/pSPnBU0sAQpNpVM+MqgU7ML7bd7OilcvWK0Ro7mjI4GVZ3IJ7I2C25XlBcTcUZmMnJasb79iBUVky5wRIaOvmlCzU/ZwULMNfz4FGQwpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhaCrHTgVWzWwnFoEnUfJYJ93/o94xT0fHU+KNPtfdc=;
 b=PQSYUH6Oq5LorrcV9IGCkhiS/wpur08BcJdyqTZlFh8ntAGSVeGjw1PUvlZ58ZB2T0tfVZ74GP6M8p+7cdLU4Wg1rWcm0BYkKGzsAWLu4tYuKTxHCJZXm5yVar9MYCIEPHSANrp4MeRyQUOdd2P9gbkPq3npr1vxp1kiBLqtSeG/0H3w7BYHPdmaWTKpP51UZGmOLRjuG/cOSMs0ccAGqyPkh5EAa1MBCCV6Qzhhx5+WLI+UPleCmfHJ667Ffd+ukr9WR5gNxbM0vuxiZsCCmlp+Qjjc2vkG8SS/x70Au2h6mtlm2FUs/YZII/AkXvCEVXMEUHM8eav+c7heAoaypw==
Received: from AM8P189CA0014.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::19)
 by DB9PR10MB7194.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:452::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 24 Feb
 2026 17:32:00 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::df) by AM8P189CA0014.outlook.office365.com
 (2603:10a6:20b:218::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 17:32:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 17:31:59 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 18:34:05 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 18:31:57 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 24 Feb 2026 18:31:50 +0100
MIME-Version: 1.0
Message-ID: <20260224-update_mp251-3_part_number-v1-1-d8bf2033b3ed@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAIXgnWkC/x3MQQqEMAwAwK9IzluwsbroVxYp1UY3B2tJVQTx7
 xaPc5kLEglTgq64QOjgxGvI0J8Cxr8LMyn22YAlNiWiUXv0biO7RKy1qmx0stmwLwOJMqjbZjT
 T15sWchCFJj7f/Nff9wNMJidRbAAAAA==
X-Change-ID: 20260224-update_mp251-3_part_number-42196c4f7d49
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004A:EE_|DB9PR10MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: e7331d47-4b5a-4e1b-1835-08de73ca9da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3FvQkI4UElwOFI1KzNVUEVsRExyQndlc2pHSlFYMTBtODJnTWlhY05PQXdS?=
 =?utf-8?B?L2R5enZmV0svN3FjdHBNNWN0UDhZQld6enNYSEJBeEdaU3ZsUFpMMHdtR2k3?=
 =?utf-8?B?Q2JzbEVlRjRFTTBvSytKZ3NtbENZWTkyejh2RGlRNG8xZk5GSUhqNEQweldK?=
 =?utf-8?B?bkdoNzdRZll0Uk1PYmN2MXltcm9xWXpkVldvU0tMN0t3b3BwRXNiSUNlMTZW?=
 =?utf-8?B?bWJoUVVHVEtSQW1UU21ZdndORitKUzRRTWI5bDU1U1J6QjlSa2JOSjVEY2VR?=
 =?utf-8?B?bEJJcFpVSjgvazZMQmk2Zk5Qdnl3UnJjdDVDaThxeklMMEtJSU1VV045d0p5?=
 =?utf-8?B?dU9FN3ZKNFRsTGRWYVhmV0tVc0VFbmd2ZmVlSnlPQWN2N013THh0VTdaNDhP?=
 =?utf-8?B?emJaa0VKZ2FVVG5OUTBaaTNZVnZRblJ5MVRqK2trMW1oNncwV1R5dW9DNVo2?=
 =?utf-8?B?OWhmYWdqWUhDUzNNQ2Y4bTU3ZncvclpHeDEzQXJTODhUUWx1RHQvc1ZvMFRz?=
 =?utf-8?B?L25VeTJjcUVtSzdjdThQbUk2Qm9EQis0RlU4TzRaUnlKYVdFYk4yZWpLSXVl?=
 =?utf-8?B?cnhhVW5XQS9pNENycGtWMjRkOWI5aXhDaEdFdkJkYTlNdUJmaFZTVWZiTW5n?=
 =?utf-8?B?VDRnb3A3TG0rYjNhekdjQjJJc1dFRXJuanlIODFnRkpydnpTdWlCMDczcGtG?=
 =?utf-8?B?ZzhWT2ZjU09UY1BzRWZLNUdPK3FoakpJYUcwaWd6S2hUUVRkMkdwZW5YMkpG?=
 =?utf-8?B?TlF0ZERtUEp4QStlQURsTC9WYzR0NHFOUXlaOXdqbWNyTEZCb3JzQ1FrN3E5?=
 =?utf-8?B?c2tlTzF2V09WdVdBalROcko3NlJZNWVLa0JXMk9tOWtrWDZtR0lTZmV0MXhN?=
 =?utf-8?B?VVFieDdGNG43Z2dkTFhGQ3k1NFlEaXBLZnVLaW9hT2U2U0xXOEIxekdlYnY1?=
 =?utf-8?B?Z3RiNEozUkthSzI3cHZBL0ZhRU85cG84NnMrZ1N2WEpyNjFEMWs4MC95Nmdh?=
 =?utf-8?B?Q2xlNlhubnhLVUVvUWJOL0NJSDdYdEZSeFkrcWFDVFZCZzNVS2dxMnlmY2pk?=
 =?utf-8?B?Z3NmTDJ6bUFuMnI3MHg4RHJMQ0pJYU91cmd3SEZzYXBzd2g4ZTRONmx4VnBL?=
 =?utf-8?B?cy9OVitGdUNCM3ZkSjQxVlRSTW5KdFppdUE1MnJXL1VMbGJJWnI2c3dPUThp?=
 =?utf-8?B?ZnBvWjhsSVZwbXV0YlZ3UDV1V2k4SUN4RVlUNG5TdTdnSk5IQzdxME9BcHJM?=
 =?utf-8?B?VGQ1b3JEdzAxZk0rK3BneVhpRXdPT0xWYzdxVlJMWnF6TTEydWRWVzIyVXFm?=
 =?utf-8?B?bmNaS1hNbzM1bWxXSkp5VCtJQzZNTDlWc2d2azFlcWF2b0FwUWlhNWNqVzh6?=
 =?utf-8?B?K3hSNGxZMzlwUlp4RmJvcmx3aU90bnM1K3FzcjNuT3E4c3hKQnhadXFXZGNi?=
 =?utf-8?B?U1U0aXRiN0F1MVp2VDh0d3pjdHhCS2NkazBMaXEzMjBGRklJMXFVMU5zSE1j?=
 =?utf-8?B?amdJeStTSk8xUitRQ3VXczBRc3lSQUJoVzZWUlRydGJ6NGhxVmV3SGdzTVc0?=
 =?utf-8?B?SHlaYSttdXQyR3pocVFSaEhxQzhQSlVtYWp3OHZTNVJ2NVQ0d2dVUVl1N2ZG?=
 =?utf-8?B?QjBYekExZldxbmVjY2JiWFFhaTdVeEV4S283dUllZEZ3bFQ3QlAwUXdXNVRt?=
 =?utf-8?B?aEwyYmQzWDQ1NENpV0hjcUY2ZytSU1VoUElPSU0ySFRtTUdvd1NSZlZQZWRy?=
 =?utf-8?B?Tyt0MTdhbTF1Rkp1UGJtZ3RIak00OUJyTWxRdVg1ZkU3UWxtemNnNE4vME5o?=
 =?utf-8?B?N25FejhwVGZpU1dhdUpjV0w2T0NxZmVpb3JtUi93eDYxalN0Z1hxL2I4RFRQ?=
 =?utf-8?B?WVJzMzluajY5SUlaUnY0aGJ5UUpyeHFrb1VCdzlXTjNrRWNCV1JFNkVCVmpK?=
 =?utf-8?B?K1Ria05KTTVsNVRGL1FwSzVoR1QyRWVReWo1Z3d1RVdVMHhPQ1dSZHpTVTVZ?=
 =?utf-8?B?ZHkrS0lSbFJmSVV5cnRzakhLSTJObDZQMGFuZWlHV2hNcDlMeTVZbEVneWNr?=
 =?utf-8?B?c1BsanRodEJRaXZHeFJVbmxNLzJ6c0pkby9yYkM3eGxVdUJ0aG9Ua0RyUXY5?=
 =?utf-8?B?Y0R2NjNJNlNtMVNWcnh5STdOYTZuMTlFcEUzNDh5TUlBbGhGWEZvdm1aeXl6?=
 =?utf-8?Q?Tuixutkbo2p4Mdfz1g+hJSGoLzqLPbBGVK6H1EdLjVug?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: C3LX8Zy+GKcoHnukGJ16thXiOR/RCC5ko+CDTRZsHEXLQlaWsF7mm/uC2V7bl03qX3rCmCz7V419IvUqVKbi04NfkRd6mZpD9P5AAJWZm1v/jcK7GFpsoDfN6bikOEZMNLvEfj1q+5Xh19hJxl3p/zTZpKTUfnKq1yicS2cN1tyPVDoq3NqYsXFgSKsXiP7l4R2d1lF0QycY4f/Lyf++op709o6N5i8zlAtuZZGD84a9TgKrYAXb0t1peBTOX4drHzg35hVNhpiWhZW5wj4KLEEa2DOXEviJPJUzID+OMm6Ymf6MdT5fPP4/mGOiiDirvRVocMK2vIsFF7Qx3I7wVAYrIaKt/Vw9EdXQrO7seAy7bSeh6klllZLfNK+w+wj2+/uinBX79Iu1adg/JLbMP6vW6Ih/0eoMvGUd/hLnP6ap6E0OnCfDce4q/AZBK8ZB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 17:31:59.7446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7331d47-4b5a-4e1b-1835-08de73ca9da0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7194
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH] stm32mp2: update part number for STM32MP251/3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2311418A8D7
X-Rspamd-Action: no action

update part number for STM32MP251/3 for last cut revision.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/include/mach/sys_proto.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index a875907ac3e..05ce869c428 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -61,20 +61,20 @@
 /* ID for STM32MP25x = Device Part Number (RPN) (bit31:0) */
 #define CPU_STM32MP257Cxx	0x00002000
 #define CPU_STM32MP255Cxx	0x00082000
-#define CPU_STM32MP253Cxx	0x000B2004
-#define CPU_STM32MP251Cxx	0x000B3065
+#define CPU_STM32MP253Cxx	0x000B300C
+#define CPU_STM32MP251Cxx	0x000B306D
 #define CPU_STM32MP257Axx	0x40002E00
 #define CPU_STM32MP255Axx	0x40082E00
-#define CPU_STM32MP253Axx	0x400B2E04
-#define CPU_STM32MP251Axx	0x400B3E65
+#define CPU_STM32MP253Axx	0x400B3E0C
+#define CPU_STM32MP251Axx	0x400B3E6D
 #define CPU_STM32MP257Fxx	0x80002000
 #define CPU_STM32MP255Fxx	0x80082000
-#define CPU_STM32MP253Fxx	0x800B2004
-#define CPU_STM32MP251Fxx	0x800B3065
+#define CPU_STM32MP253Fxx	0x800B300C
+#define CPU_STM32MP251Fxx	0x800B306D
 #define CPU_STM32MP257Dxx	0xC0002E00
 #define CPU_STM32MP255Dxx	0xC0082E00
-#define CPU_STM32MP253Dxx	0xC00B2E04
-#define CPU_STM32MP251Dxx	0xC00B3E65
+#define CPU_STM32MP253Dxx	0xC00B3E0C
+#define CPU_STM32MP251Dxx	0xC00B3E6D
 
 /* return CPU_STMP32MP...Xxx constants */
 u32 get_cpu_type(void);

---
base-commit: c61d6f67f46f05149182b33c3c0ba5d9b6b46889
change-id: 20260224-update_mp251-3_part_number-42196c4f7d49

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
