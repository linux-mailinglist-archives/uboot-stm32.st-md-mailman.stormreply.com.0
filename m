Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPxkO4wdg2nehwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:21:00 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8991E4687
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:21:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E0AFC87ECD;
	Wed,  4 Feb 2026 10:21:00 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31B06C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 10:20:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8aL4DaRdt8W6QJUIdKMvDMwahUroKZVx+ecnoSSsIPCX1/8I81VEVe63H/gH154dGp9vGHt3JTDx0qJF07QBJwdTxnWta7/TraIzfMGU3lLwVfC98/M0uSEZRaROTobF2LbP5F0ARVLvR7nlCQel/jMDig+oUEK4Fowy4wD7KFbjBVfPO295jNS3LCDHrgS7Gmkh91ODIssaW175ADgQYbN+2J677sj1zRFj7BNQBU12ouStdc50nJi4862WKXLyQktM2pTvlon6nG/4mfnaAapZ+kRSjV7b2dtNcNp0wRnk/rClLAiqdHMwOWreN+Ptk+cBF9Bl9GTThH5aqTiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdMlRAk1HzxK0hH9h5HZwxi885+TI6sJs6qfTdWMHOE=;
 b=nfM56DtZIpmh1jb6R1iOi8mutBqYw6VFXpiJkbWgwibSYJ8luyVUpMBnmuJdriS+xs+m2K3sx8A5KaNlh0uOD4SvNxlGnhEwaeIxfJZYcmj6/cVF9TAtVGazD1YtJjEKK61fMMP0MvxM96TWNL4I7qkYBADtJuxKrrkyljLvCTMdAdyjVh0crYB1GFrswOOyjwJsKwNnsAdvmZVHS7HqT6FGnqkwxbjF0lJLOryyLmZ1mipL+vhVryHX5XGcaehef/8FBMx3MnJYa3i3mRKdZr4wgpQYvW1D7Vqk5m5W6rPVfPbc9+XBJK3caBi9cni+icp652cKoESVLcM4xXj+Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdMlRAk1HzxK0hH9h5HZwxi885+TI6sJs6qfTdWMHOE=;
 b=O1RI2vGeUSP470C1390QbPQRtE+sz0tQsvu/z3uMc8AQIC0SvS3gKcvx30HFdQL29kZWWq8L8rs9PhbDGc1Bo3UJrEP3iUEEn+jjXU8wCM3sesg8TBTkkw0MerAZPh+jBoAyHLOwZTEp/3C1fExQeMi8CxbvbL7z86m0njO4FpEGv+DCMj0VAq3oLfWvykUUXlGbtvaj7k0LyFmpa4uLgOW1f+uQZcU+RgwOxjd0/AE+6n419WdbhmKoFjM2/mD/twDru/iMI46W+mPoM8sxizPcFgSeHy1DSpZMKLSj+SuwdtIBB5f40lf9SA9MsD8Fg6d+59BdJx+/OgTwyHgjBg==
Received: from AS9PR05CA0140.eurprd05.prod.outlook.com (2603:10a6:20b:497::14)
 by GV2PR10MB6257.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:78::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 10:20:52 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:497:cafe::48) by AS9PR05CA0140.outlook.office365.com
 (2603:10a6:20b:497::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 10:20:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 10:20:52 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:22:30 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:20:51 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 11:20:50 +0100
MIME-Version: 1.0
Message-ID: <20260204-upstream_update_stm32_cmdkey-c-v1-5-d95374395840@foss.st.com>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
In-Reply-To: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|GV2PR10MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d959b8-b006-41c5-843e-08de63d71311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVd3c2orZkxRbkNOL0JZbVNQeEFjYkxlaENsOXUxa0tHRTZCNUlEcjJLQkhS?=
 =?utf-8?B?cUVWVDlqYVVxbGV1MDBFREpjVTRaYU9aZUlkMGg3dTNDZ2FiczYvUDNQSzJ5?=
 =?utf-8?B?YklEcXBlZnFLSTdTaU91djR1cUJ6VlVCeldXUEdwaThSaTlyaHNBVWZDUVBO?=
 =?utf-8?B?NzV5NVA3amIvMzhEaFRCVXUybitVcWVLMVVKQ2NUMGNwRnlId1doTS9uVXBC?=
 =?utf-8?B?SVJ5L0xGd1FoTHRFb3ozT3hjQmx1cXlFbWtjcFpIaHR0RlJKU254RWxCOFJO?=
 =?utf-8?B?d04yWHZUaHRWWndMMFlpeTZ2Vml1b1FUaU1nSVRzZTNkRGFLQnovc1NweFNh?=
 =?utf-8?B?dkVnRlpldUtwbThXNmdtL0VPa2Y0eXJvQktkbmRRUnBYQjZycjRJQnBvZkFs?=
 =?utf-8?B?cVRmcGZsVnRwcitQWkloK3ZvK3B1ZjUwWEFOQTBJVWtMdEJrRyttb1NnbWo0?=
 =?utf-8?B?L2I3UFZXa2txY3ZobXp0MHRJbWdlR1ptUklxWENHTitvVVlWZGpobk94RTAx?=
 =?utf-8?B?K1pVSEt1ZlVqMVFxZkcxQ3h6Q256Q1FRY3pORFNQeHBmK2xGTyt3dXJPQ3hp?=
 =?utf-8?B?NlNNTktTQjNyMGJaSS9hbEZvbjdSZkE2RklVTm1tTDhPeHJseFhVTlF6UHlh?=
 =?utf-8?B?K2RvcUVya05DK245YWdqUFMvZnVVVG9jelRYSUFHNXhpRm0zeGJHbTZXZWtL?=
 =?utf-8?B?N3E4L0psbFFTMGx5d29nbmRRaHlNbjdDbmtPY3RFUmoxUnhGTGZMUGpDNExs?=
 =?utf-8?B?dHk4ZEdjWkNZcVdRQy9KdXlSY2l4enVsclo4Z2FDU2NuZW1lWW9yUzdTNjZX?=
 =?utf-8?B?TmhqZWlVQjJpaUQ3dWZMaHZ6eUl6SmM0TE1QOWNESDc4eHkrRlplTFlub2k1?=
 =?utf-8?B?eEhBU1hPOXdxMjhYQ2tuT1REbVlQWFJIam0wYVFoTFhhMlZ1TDh4RHB6RXpQ?=
 =?utf-8?B?d3oyYVpiS3FsanZ3MS9wKzE0bllIdkFxdGs2TGhvRFAwTjlFQVgxUnlmaE9Z?=
 =?utf-8?B?NzY1cGVZazlCTExaYWdMcXVhWnpwRDd0S0IraUphKzVXS3hldDdTWjlidlVB?=
 =?utf-8?B?YXpWUU1nNkpGc0RXWXVqL1M0alVmNFVGVURUNnZRSWxQNHk3Ujd2OUxaWCsr?=
 =?utf-8?B?c0piV0x0Qy9CZXFiMHFVV3liK1d0SjAzQU9ZNVVGc3lkY0xNUmV3bGtpQmZq?=
 =?utf-8?B?eDRvUzNHL0sycUFQT1dYa2U2ZnRRTURsRnJmSUdtUGxBR0d6MTFuazJRcTVM?=
 =?utf-8?B?SERBL3dtNDdWT202azZjem5ZaVg1anJTQmhxL2NjTmo3TXF4SUxML0FxeXdN?=
 =?utf-8?B?YTFLNk55Uy9FaU45ampzcFBjMityWXlycTNndEJMek1hTkcwY0tsZ2JuQnZS?=
 =?utf-8?B?QVZJbktsaFFyRjdUMU0xanpQNjMzckxWd2dweDJXWVlGdXFSQjZLQk1maFBk?=
 =?utf-8?B?S1hGMEEyYTBqRTlnaHBvOWwzb082czNvRy9GTHY4QU1ndjVBU3BDQjFyS0wr?=
 =?utf-8?B?L0Zmd0wxMW5KSURuTE54bU56QVcwN0hZbTMvNXVCdmVaTmpZalNEbmxBUEZF?=
 =?utf-8?B?dnBHcm5Od2EwUmxEUUwwZmpMcncwcjdXMzZlbDZPUG5VY09Bc1ZxTm9uZjh2?=
 =?utf-8?B?Q3YybGRxQlFiUllQcVNOUHhjbkRSa1lESG1aR1p3YmpYcEhub3JBUlNka2Fl?=
 =?utf-8?B?V1lmWUxTbk9PaVhXekk5S2ZqMUU0OHh1LzYvY2lIMGxqVHZZNU9Lbis1bnpJ?=
 =?utf-8?B?Rk9SbE1BSTExVUxmNjArSHh2VjlnWVJoLzdoNFJsemZoaHljTXozNXUwK3dt?=
 =?utf-8?B?aWZtNzlNaXc5NUozZW8vK29za0ZXdjFJLysxelNzcnhURVExVzRodXY1bTVi?=
 =?utf-8?B?aVczVzhqTmN4bHF2bEMxOHNkQ0VMejdLL29qUUh5L1BOMjZBdHBGalgrcFlY?=
 =?utf-8?B?UGhQN08ySHJrTVlXTEtBcXh0Q2FFUnFDcm9SeHVTYytvQzh3UGljOTYyV2p0?=
 =?utf-8?B?ZkpIWU45Z20rUXRxZlZIbGtvcnpjU1gvZWMrVEtuNGdDdWdrZkY2Z3pMK2Na?=
 =?utf-8?B?dnZVV0RIUkY5MHhhcU02b3d1bVp2aDBTdWw5RnJaMXFrS1FiMHdxTWdmOU9U?=
 =?utf-8?B?MzAyMWhOUjE3QVhDKzAxbUUwc09CL0swWFFZRmNhczNTTGttTEtUb3BZK085?=
 =?utf-8?B?ZzF4bjBsVlN2SXltZlMxNE5PS01MUFR5SlhtOWEzTm1acHk0RWd1MzJEMDVa?=
 =?utf-8?B?ZGtvVStyRXRvZHJzdnZEU3hRbFVnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: b9e8wAl/LHTpr9obowid7bLREUKV5WHfoJfR4h405xufO8gvRRzAJUEF0NitbbOuWbcwc4PNsd1gmiqG5bzzWUB387Wzd4cipG5s5E0EZhIlntdjWaOhltocAs48wuA+LPfUK+z71LQylac3mzeqYq9/PMz2vszg5oHHJRmbARvWHs5f6t0Qs3EFBwdd1tETeErLjqugdqauyEM/VlRYXkitOfFwmUBE+3brf7/ZVCLzpmYjaj9L/qwKee7YKJk637904K/CbGYFlsP3CgwwqEkVgBacXf/FZui+eo5wTKtqUrc0Hc69UF65LqMDxaQj4HOsg0PJ+nCYR7N7bo6neQysgzmrjJQZMfiiIedhLZrx6wqftX2G/YZzj1vos2hyXdrN5zdAncufbm+ajKhrrkOFXwapvIoaCNaFL6vxKZugeu9WFbh763OkQiISHysO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:20:52.1457 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d959b8-b006-41c5-843e-08de63d71311
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6257
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [Uboot-stm32] [PATCH 5/6] stm32mp: cmd_stm32key: add support of
 ADAC public key hash
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st.com:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8991E4687
X-Rspamd-Action: no action

From: Thomas Bourgoin <thomas.bourgoin@foss.st.com>

Add support of ADAC-PKH for STM32MP21.

Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/cmd_stm32key.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index d1432ba1e23..4610841f825 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -94,6 +94,13 @@ const struct stm32key stm32mp21_list[] = {
 		.size = 8,
 		.key_format = format2,
 	},
+	{
+		.name = "ADAC-ROTPKH",
+		.desc = "Authenticated Debug Access Control Root Of Trust Public Key Hash",
+		.start = 238,
+		.size = 8,
+		.key_format = format2,
+	},
 	{
 		.name = "FIP-EDMK",
 		.desc = "Encryption/Decryption Master Key for FIP",

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
