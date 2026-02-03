Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLQhOCUngmnPPgMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 17:49:41 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AEFDC402
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 17:49:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C806C87ECA;
	Tue,  3 Feb 2026 16:49:41 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48803C87EC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 16:49:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMpUep/uEaiBadqSrl3wC/PAHo+bpNRsrYJ3mMqyr72zmwynoqiKL1/mWx642ilRKlDv9YJG2xT4XAS57mPhQwwO7mkggdw5CINlUG0qkewCcf1PzBEVVuq0fF/YW73kWPE5dnyobLyDvvKG1NT9SFp8Xta1Hgvbn6+DckIdyf2XMoWqNkgRvza/To7khNGu2SPe6wtBHN9S7eL3Hb1zyQS4yDPuKsF4HQ0sOpPXk90FtOnIz8zz1q8ZssFS/xjrNcCMren8JEJPI3K6zjCQ9nLtnpvI+x68fVmKhwS0x43BdhZHKg4iFY8r2NFSvE/jhskHt7wFww7B5d58x7efwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/DBJfHtXRW9jcC9bdTzmAWp7FGgXN4WdILPxAwjDlU=;
 b=b/K48nocuJIVHBLnoX069Xk2yk2I8ZI84LHXu2ffYPO7PP0ST1t5L9BwjRDl8l3tPYFghXw+bncvomy6CM2LQZzn9qqhN3gkTUGrtEsPbyi+J2KGZCAfgV5wZpym4fvkeSFGYb3MsoA09S2rnq3UwKetLoSumbfRv09PO1iN0TsN2M3r8ugO4smuzGug6xvsG407BACH2ol7TTowsp7USv1MqpUDkfmATz1uuCU/+NcVLZvtc4z23e4gzde+5D9oSKVD+x4iTsZxO2cs6VwSdeUsoh6ajGp5esHXpM/ON6GcGIrT2OolOdWf5Mt69gXlQsZbCAWOCk67WpKTyWkbig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/DBJfHtXRW9jcC9bdTzmAWp7FGgXN4WdILPxAwjDlU=;
 b=YYMulVb/vQr92lGvEI+TWQQXXk0GFVKfW2U8kbvAMPjkWORQisjgVBi7ZIv2AOu32FxdGrqljA/y/PxyMQ7GEpD8B6sv+2uRPp4FaJlgHo2scoFkdLbZrB0KJPpYpVGyQe79T+xnQQQm0uE0JvzspL4hgXmNv+Flf1E0goCyAjbs9gVm1bR4g2T9x4vIpY5ma/OEV9/DTcOZKXd5P35KvUdXT6b5uLJmYcZ92QmLidDcTDtpkaG3dit4q1gQNKnyiS1wBZ+Q1PJfcEDzk2idUpz7cSg4ZVJ632MUcwLAGjJ1YYT6HDLpxBKm8my4wcu7aPVfZ53SE0qxLw4iL3WGOQ==
Received: from AS4P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::9)
 by PAWPR10MB7197.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 16:49:37 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::7f) by AS4P195CA0003.outlook.office365.com
 (2603:10a6:20b:5e2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 16:49:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 16:49:36 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 17:51:23 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 17:49:36 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 17:49:24 +0100
MIME-Version: 1.0
Message-ID: <20260203-upstream_add_stm32mp21_support-v1-4-48ca3409cce1@foss.st.com>
References: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
In-Reply-To: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
To: <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A66:EE_|PAWPR10MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 911ca2ec-0424-46d5-0372-08de6344373e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WW9TL2RZMDFqR0VoNS8raE1hNTR2TGtFL2ppYnNrWFNFMndXZ2JTcnFZT3BP?=
 =?utf-8?B?RUFQa0NEdWM4WjZmcnEwUTFjS1lsbGpNeXRaRUJBM0JoQnZsbGRTbVZTb0VJ?=
 =?utf-8?B?bFZQcWNGRDJIZGhKK3JqU3d2QS90Y1U5OGhBSHFvTHFDSGVzTkRYSXVweWMx?=
 =?utf-8?B?WG1zbjkzOTB5cjcyZnlQeVFxNHkxdGs2WFRUZjNQUTBodHJlWWFjMWZQVFkv?=
 =?utf-8?B?SXFxR2Y2VGtyTnhDSzNHeXQzb1pQQmcvODhOTGxEWU1uUEx3cDl2aUljUXpK?=
 =?utf-8?B?RDVDNlR5c1ZRL1pzM284SXBTUG1kTWEyaFpsdGNkdndRVDROdzFKWlRobkVB?=
 =?utf-8?B?T3kxMTR3UVZiSDJnUGxBU3d6UlE2S3JnQ3JnU01GVkJMOUJsZ292TkFQSmky?=
 =?utf-8?B?NG1NVGN5ZUswMHFnQUpKWTZXNEJaMjBraHJJdTJHTE41SzlqNDFvQm9JMVFH?=
 =?utf-8?B?bXJldGdqRjNwNDEzbTRZeEt6QjVKZ21KdGpMN2Nicm1rUWd1OVVPZGdpZno5?=
 =?utf-8?B?TUFBVjlhM01sMk5kRWh0OVF0cTZ2WEQ2ZVRlWGM0Rlh3aGRFdS9hcTVKSTdN?=
 =?utf-8?B?UG5kdWZiako2enhGaHVOTVNxdlBCUi9mWm91RVpUbndEUWMyTHBmK1NEcmJv?=
 =?utf-8?B?bHQwSHBMcVZPY0YvVWNvWjkvRzVTTzBTcDRKUTZCQjZxd0h4T1lORU5xZ2JY?=
 =?utf-8?B?WjJ0Sm0yeU5BajRON0F1TXZGNGVhZ0J2ckpBUXNUWUpFdkFGOUpnVWhUR0VI?=
 =?utf-8?B?SFFmTTdpeS9UWXp1dzlTdFZtb1IwY0YydHlPeWdmaXRvVTBwQUNlMmlPM0xI?=
 =?utf-8?B?My9WeStBUHVISnFiZGhudXJNRU9BeVJ5eVZTUW9neFNCcW9tNThwUy9xcDJV?=
 =?utf-8?B?RUk5V2tIdWNVYTg3YzB4ZmxGc2RWRmdmSlNqZ1ZTSEdPamM2a21XbFhpTGIr?=
 =?utf-8?B?RjI0RFBsZGg2QUlSdzRQWWRUeVB4YU1NTUd5NDJHRnQ1TklXdnk1Wm5mK1Zw?=
 =?utf-8?B?aStobHlQYmd6alNsRnI5eEV2VFpvSUwweUlQeGk4NUtTQVlscVlBSHFzRUwv?=
 =?utf-8?B?dmZpMFRQbmQ1aDhsanNNUlFvbC9GOVZwMXExYUZ1U2IrSnVXb1dOTXd2YjNE?=
 =?utf-8?B?YXhXd2lHTVRXQmllSjlWclFuTzA4cEdaM2JocGZxcWpXYk5mN1l2NWwyNjJM?=
 =?utf-8?B?Nlc3Z2V6aVVzRWdKcmgxRnBnczk2RHRKV3NXMTVwSTZFOEJKajY0NFdyWi8v?=
 =?utf-8?B?RHhzN290NTJJejl6L0xUVVR2R3NNZzNtbGcxRWNMRS9wREhWWk5BakVQQzNq?=
 =?utf-8?B?ak5UQUVBSDVGcUZxczRxRDNxOS9JT0VWeCswZnQzejdHWHBIeVdtSjgyWmpI?=
 =?utf-8?B?aXJITUF0MHFRNFFhQ3NhWXBzbTZwcXRqOWRJNFRBTFNIc3RxSzJxMDhtaGll?=
 =?utf-8?B?c055S2pxZFZWenh5SDFCRnNodnFjNnBFUlducU1yRDhpTE9tTDVnMUxISXBu?=
 =?utf-8?B?VkNVRTRqSHdGNVN0LzVUb1UvS2pmNDlHdTVaMCtyWUYrRTVxdmN5VEdtSFpL?=
 =?utf-8?B?WWxxell1VlVJMmpwcHpKRHFTZTl6UHpFaHozZ3dIYU5tRWlwR1VDWWw4MEQv?=
 =?utf-8?B?Z1Nlemd4bjdZMnRyNUF3SEg5QWVteUZUeWowQmg3VUxBM295amJ4YzJUaW9a?=
 =?utf-8?B?RUNxMWhRckFDdTZYenFhUXowM3ByUXo5MkxTUXArQjViWXc3QlBCSjFYKytW?=
 =?utf-8?B?aklMR1ZqaEdWQ1FOalZTR0VNOHJhS1lrbnAvcWRYMmMyVzR1bnBtZHFOM2ZJ?=
 =?utf-8?B?c3dzZlU3ZS8wa0NxTWxHWkhJMXBSMHJlcmdLMFhYQ0owcjJvTDJacmlPUWZn?=
 =?utf-8?B?dEpXS25FTUpJcUxMbGhSeFJlMlpYeDFBc3ZXSVdJbEh2b1g1M3FhNnc2ZGVq?=
 =?utf-8?B?U1RmSkV4RDYreHVmK0hpdnNjcTBMbzZib2wzS0JvQ1dGR3R4Syt1UFVQeElI?=
 =?utf-8?B?aWlyb2xsMHc5eUxkd2pmdTd1bkhKY0ZsVnRUUDFLZWltazlrSU1ydmRoTGM2?=
 =?utf-8?B?Z1diR3IrOUFUN3E1N1VGR2tSdG1GaWVGeldwZEtzSUNucXJTWWw1eFNHTHVC?=
 =?utf-8?B?eGpNRjBidk9GQXhWRGttVUxMSG43S1RhVEdsdDBWb2ZyVUxBQWN5Nm90eUEw?=
 =?utf-8?B?WlRoSVEyazdoTVNnemhpRGRxMnVXb09Ib0Q0RGVGL2p1WVF6Nnk0aVVXaW1v?=
 =?utf-8?B?OWgyTnlVSUZoTzhTNmdqMzhSY3ZnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /MOb5DPFGh+61tLfdi0y91nNEz2fwLgmsSP+nxG2qEEKXnF94GyXUWf3mgVSgdrePr3h71Ehynf6tuRkYWfVYp+CKtdQKRUBP7vg0YGNqqbedHU2HTgm3IY/s2cLD3gmnYfYXh5EDbbTOz6CTghSd98t2oGc7vfRZM0J/iTpXXXSh4K9pRpXfiGEnIjDv3Bom35tjl7L87mDT8powIIxiFejxhMOJTx7wsFzggTSdAjSpHW2vVTL6LzrsvGrWMYS5V6bqoQiHn8rVbGibgxZj+nLbSMy31fNfk1bkcNHdLlv95jL/lUMafGrT4wQC26Hc1eV5NHl4lZfwMBjY75PcIKTLfm7mkkrk12pbTMuTt7hTMJankIVCkY/5tVxDrO5k8uiw/z1jfruNZyTWsxInaLm4rtV5zIP3bZzXGE27GpI3swiwipyv2y3GPu+JPSN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:49:36.8073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 911ca2ec-0424-46d5-0372-08de6344373e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7197
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Cheick Traore <cheick.traore@foss.st.com>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>, Patrick
 Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH 4/7] stm32mp: cmd_stm32key: add support of
	STM32MP21x
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:michael@amarulasolutions.com,m:marek.vasut@mailbox.org,m:quentin.schulz@cherry.de,m:cheick.traore@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:fabrice.gasnier@foss.st.com,m:nicolas.le.bayon@st.com,m:patrick.delaunay@foss.st.com,m:lionel.debieve@foss.st.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8AEFDC402
X-Rspamd-Action: no action

Add cmd_stm32key support for STM32MP21x SoCs family.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/cmd_stm32key.c | 70 +++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index f5def4cd2dc..f1e0a3e817c 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
 /*
- * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
+ * Copyright (C) 2019-2024, STMicroelectronics - All Rights Reserved
  */
 
 #include <command.h>
@@ -16,21 +16,21 @@
  * Closed device: OTP0
  * STM32MP15x: bit 6 of OTP0
  * STM32MP13x: 0b111111 = 0x3F for OTP_SECURED closed device
- * STM32MP25x: bit 0 of OTP18
+ * STM32MP2xx: bit 0 of OTP18
  */
 #define STM32MP1_OTP_CLOSE_ID				0
 #define STM32_OTP_STM32MP13X_CLOSE_MASK		GENMASK(5, 0)
 #define STM32_OTP_STM32MP15X_CLOSE_MASK		BIT(6)
-#define STM32MP25_OTP_WORD8				8
-#define STM32_OTP_STM32MP25X_BOOTROM_CLOSE_MASK	GENMASK(7, 0)
-#define STM32MP25_OTP_CLOSE_ID			18
-#define STM32_OTP_STM32MP25X_CLOSE_MASK		GENMASK(3, 0)
-#define STM32_OTP_STM32MP25X_PROVISIONING_DONE_MASK	GENMASK(7, 4)
-#define STM32MP25_OTP_HWCONFIG			124
-#define STM32_OTP_STM32MP25X_DISABLE_SCAN_MASK	BIT(20)
+#define STM32MP2X_OTP_WORD8				8
+#define STM32_OTP_STM32MP2X_BOOTROM_CLOSE_MASK	GENMASK(7, 0)
+#define STM32MP2X_OTP_CLOSE_ID			18
+#define STM32_OTP_STM32MP2X_CLOSE_MASK		GENMASK(3, 0)
+#define STM32_OTP_STM32MP2X_PROVISIONING_DONE_MASK	GENMASK(7, 4)
+#define STM32MP2X_OTP_HWCONFIG			124
+#define STM32_OTP_STM32MP2X_DISABLE_SCAN_MASK	BIT(20)
 
-#define STM32MP25_OTP_BOOTROM_CONF8	17
-#define STM32_OTP_STM32MP25X_OEM_KEY2_EN	BIT(8)
+#define STM32MP2X_OTP_BOOTROM_CONF8	17
+#define STM32_OTP_STM32MP2X_OEM_KEY2_EN	BIT(8)
 
 /* PKH is the first element of the key list */
 #define STM32KEY_PKH 0
@@ -69,7 +69,7 @@ const struct stm32key stm32mp15_list[] = {
 
 static int post_process_oem_key2(struct udevice *dev);
 
-const struct stm32key stm32mp25_list[] = {
+const struct stm32key stm32mp2x_list[] = {
 	[STM32KEY_PKH] = {
 		.name = "OEM-KEY1",
 		.desc = "Hash of the 8 ECC Public Keys Hashes Table (ECDSA is the authentication algorithm) for FSBLA or M",
@@ -138,23 +138,23 @@ const struct otp_close stm32mp15_close_state_otp[] = {
 	}
 };
 
-const struct otp_close stm32mp25_close_state_otp[] = {
+const struct otp_close stm32mp2x_close_state_otp[] = {
 	{
-		.word = STM32MP25_OTP_WORD8,
-		.mask_wr = STM32_OTP_STM32MP25X_BOOTROM_CLOSE_MASK,
+		.word = STM32MP2X_OTP_WORD8,
+		.mask_wr = STM32_OTP_STM32MP2X_BOOTROM_CLOSE_MASK,
 		.mask_rd = 0,
 		.close_status_ops = NULL
 	},
 	{
-		.word = STM32MP25_OTP_CLOSE_ID,
-		.mask_wr = STM32_OTP_STM32MP25X_CLOSE_MASK |
-			   STM32_OTP_STM32MP25X_PROVISIONING_DONE_MASK,
-		.mask_rd = STM32_OTP_STM32MP25X_CLOSE_MASK,
+		.word = STM32MP2X_OTP_CLOSE_ID,
+		.mask_wr = STM32_OTP_STM32MP2X_CLOSE_MASK |
+			   STM32_OTP_STM32MP2X_PROVISIONING_DONE_MASK,
+		.mask_rd = STM32_OTP_STM32MP2X_CLOSE_MASK,
 		.close_status_ops = compare_any_bits
 	},
 	{
-		.word = STM32MP25_OTP_HWCONFIG,
-		.mask_wr = STM32_OTP_STM32MP25X_DISABLE_SCAN_MASK,
+		.word = STM32MP2X_OTP_HWCONFIG,
+		.mask_wr = STM32_OTP_STM32MP2X_DISABLE_SCAN_MASK,
 		.mask_rd = 0,
 		.close_status_ops = NULL
 	},
@@ -171,8 +171,9 @@ static u8 get_key_nb(void)
 	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return ARRAY_SIZE(stm32mp15_list);
 
-	if (IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X))
-		return ARRAY_SIZE(stm32mp25_list);
+	if (IS_ENABLED(CONFIG_STM32MP21X) || IS_ENABLED(CONFIG_STM32MP23X) ||
+	    IS_ENABLED(CONFIG_STM32MP25X))
+		return ARRAY_SIZE(stm32mp2x_list);
 }
 
 static const struct stm32key *get_key(u8 index)
@@ -183,8 +184,9 @@ static const struct stm32key *get_key(u8 index)
 	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return &stm32mp15_list[index];
 
-	if (IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X))
-		return &stm32mp25_list[index];
+	if (IS_ENABLED(CONFIG_STM32MP21X) || IS_ENABLED(CONFIG_STM32MP23X) ||
+	    IS_ENABLED(CONFIG_STM32MP25X))
+		return &stm32mp2x_list[index];
 }
 
 static u8 get_otp_close_state_nb(void)
@@ -195,8 +197,9 @@ static u8 get_otp_close_state_nb(void)
 	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return ARRAY_SIZE(stm32mp15_close_state_otp);
 
-	if (IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X))
-		return ARRAY_SIZE(stm32mp25_close_state_otp);
+	if (IS_ENABLED(CONFIG_STM32MP21X) || IS_ENABLED(CONFIG_STM32MP23X) ||
+	    IS_ENABLED(CONFIG_STM32MP25X))
+		return ARRAY_SIZE(stm32mp2x_close_state_otp);
 }
 
 static const struct otp_close *get_otp_close_state(u8 index)
@@ -207,8 +210,9 @@ static const struct otp_close *get_otp_close_state(u8 index)
 	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return &stm32mp15_close_state_otp[index];
 
-	if (IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X))
-		return &stm32mp25_close_state_otp[index];
+	if (IS_ENABLED(CONFIG_STM32MP21X) || IS_ENABLED(CONFIG_STM32MP23X) ||
+	    IS_ENABLED(CONFIG_STM32MP25X))
+		return &stm32mp2x_close_state_otp[index];
 }
 
 static int get_misc_dev(struct udevice **dev)
@@ -352,14 +356,14 @@ static int post_process_oem_key2(struct udevice *dev)
 	int ret;
 	u32 val;
 
-	ret = misc_read(dev, STM32_BSEC_OTP(STM32MP25_OTP_BOOTROM_CONF8), &val, 4);
+	ret = misc_read(dev, STM32_BSEC_OTP(STM32MP2X_OTP_BOOTROM_CONF8), &val, 4);
 	if (ret != 4) {
-		log_err("Error %d failed to read STM32MP25_OTP_BOOTROM_CONF8\n", ret);
+		log_err("Error %d failed to read STM32MP2X_OTP_BOOTROM_CONF8\n", ret);
 		return -EIO;
 	}
 
-	val |= STM32_OTP_STM32MP25X_OEM_KEY2_EN;
-	ret = misc_write(dev, STM32_BSEC_OTP(STM32MP25_OTP_BOOTROM_CONF8), &val, 4);
+	val |= STM32_OTP_STM32MP2X_OEM_KEY2_EN;
+	ret = misc_write(dev, STM32_BSEC_OTP(STM32MP2X_OTP_BOOTROM_CONF8), &val, 4);
 	if (ret != 4) {
 		log_err("Error %d failed to write OEM_KEY2_ENABLE\n", ret);
 		return -EIO;

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
