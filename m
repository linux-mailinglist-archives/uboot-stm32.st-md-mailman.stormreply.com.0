Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMxRNIYdg2nWhwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:20:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 794E6E4658
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:20:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31690C87ECB;
	Wed,  4 Feb 2026 10:20:54 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013010.outbound.protection.outlook.com
 [52.101.83.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B89FC87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 10:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wl7IRi9HHbyEY2zDZgsDWeTYLJuhmm37JWuI5vNp3ucwpsL60RZqCQbyZnx6yXOH50JdAzlX7n9Kwmsi33B0bMy0nsDl0aqISNuSRzWXBZcwb1ZppOH2z6JssN938ZBsNUrg+HRcbg5wnwGtnzXyRY/YDxrwewcb/nDR4phPSXm+an2Pffw1M2ge07+IZftliPwIv0ih3KaNiyA4wAflBO7G613p/RtmhK3uSg2oclZ2wJpigedzFJRIEwxYshr9xLOB2gQmfX1Zqx14xhAnvlsKBjLSfThmiwbZwCqrvHWQAjpb8TFuEvZbO3kNdryrk28NFCgw/KShxxSbBjUPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6H0fsXlGeu5XpGQmD9YGDtWOozDt4ENuiOpP1goA64=;
 b=ESI/csY/ZX8k2qLLYxCj2I6Up6W/KzsSu4Rhs3I6cCmz2xhimIcKmbU7VMV2QZj9kAhrLxPfQfCYcu6gcuq7CpHgbYX3oIfr/CE3hyxjmmL5pGu0viYcuK3luUKMZPnsEqbfKjvlzNhW4zLlLkG22UktnpM9XcZt+z2vsPrMOP07jHW4syLg692jawbK/drpV0uflg6qSz+SyLxD0NRUo0HustJeyIrp+kHIBRgcx/NTis2ilK9IKZCUgASHVLoFnKI8geWr0OWO9bfH6Pf2/RXGVmE6tOz0QgMcV6aHzBZICZfoGgEDFdQKLFUSEa04mf1Jl3BBgn9XupwkUsyHeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6H0fsXlGeu5XpGQmD9YGDtWOozDt4ENuiOpP1goA64=;
 b=B/f+2GcoWG1Cei5r+rqBCQ+IzZ9KgiLWIgsW2aHXGHbYOcrQ3tjg95NmJC2D8GRwzBhMqwIkp8TLge2uAwlAVmZTh8qxHUciCjzJpZG+S91L0Di4YFZlutSvZimJilQpIq9UKFJ/Y31VRurCgrYtr26+0eLdUjEmkZPc3iSBXvDtAqHPWcWv2B4PozHVAU/WkhsMqc3hNpkE3UDBYGuo1AE4/dPB4Nqt9crPGwggX1UunWuXF3AWT0LmDLazcGAL7AV1kyvQ8VCqcMwK+V/h8Tf7uWK4+qmrXmo/lpfQtkfelywn9kM70P0ftFrfCV6xRlmvrRAeLgFip2p16f1O3w==
Received: from DU2PR04CA0080.eurprd04.prod.outlook.com (2603:10a6:10:232::25)
 by AS8PR10MB6652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:562::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 10:20:50 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::f1) by DU2PR04CA0080.outlook.office365.com
 (2603:10a6:10:232::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 10:20:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 10:20:48 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:22:35 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:20:48 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 11:20:45 +0100
Message-ID: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH0dg2kC/0XO0arCMAyA4VcZvT6FtOum26uIjKxJzymHutp2o
 ojvbnWCl38I+XIXmZPnLMbmLhJffPbLqYb6aYT9w9MvS0+1hQbdgwYj15hLYgzTGgkLT7mEVk8
 20D/fpJXUg6E9dJqoFfVITOz89Q0cjlsnPq/VKdvwy4zNB2m/CBJtQohaTXmNcUlFwgxMsDNEO
 IwX9XJmzCztEoIvY9P3+0E5NyszaOC2w9mhs8i7obPOvD7kuqKdOD4eT9+6xCUCAQAA
X-Change-ID: 20260204-upstream_update_stm32_cmdkey-c-d604d8052dd3
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885E:EE_|AS8PR10MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f64c392-6abc-4f9e-2c29-08de63d7111e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0pOS1lJMUpVTzJaQjI4SHZwdzIzTWpjS0RIeG5aSGtoTGY2K05qM0xKbDVY?=
 =?utf-8?B?SWJkbk5JL1ZkMnlHNnF6VE82Y0J0SGZZM3pnMEJBTUs2cTZJbUp6WkMrTXJF?=
 =?utf-8?B?TkRyNHFrSWkzZ20zeG01MHREM2RxQTFocTdPN1Rjd2ZjakE2SFJ5UTVHYlpS?=
 =?utf-8?B?UGZhRlNiMzdIMHBWZmdNUU8wWWpZMW9OQ3Z6NWpVOWY2UElUQ2lNRFI1L2E5?=
 =?utf-8?B?THFxNVZMdGJSMnlHUU9TaVV5VVFyUHI4NTNUTGFBWVNIWDNLR084MVYwdTVG?=
 =?utf-8?B?TE8vQkxmeVNDWlBkZGJRSlVKOS9qWGIwMHBHU0VaWVpwdkFaeVcwUHRFWTFF?=
 =?utf-8?B?NnJ2NFY4bFpsK090c1orajByMmx6VjQzQkkzNnNQNWppenVnMWRUMmdRSlMz?=
 =?utf-8?B?RDhHa3BJY1hlOGgzTmVxd0l3dzJ6c0k3bzJCZlJGcGE0V2ZtcitFSjZPSVJw?=
 =?utf-8?B?aEpvTStUdGhxRG1GWmthK0N5SnNUSlQwN0FVYXYrMXJiVVA4VW5uNzY5OGRI?=
 =?utf-8?B?QWM4OFpvTHhQODluU2x5UzFtS3piUitmMW5tTFB4Z0o3c3QxZjZZNUJ5RE1M?=
 =?utf-8?B?ckxSU254U3FCajdHM1VjU0NOcEVFUG9aNllQVzErdnVrNkZ2RkgvWk9JSUwr?=
 =?utf-8?B?MjZQc0pqM0FhV0tBbGNaVlg1djFxUXRzekx4dlIyR2tiSW1zUVVjMHQxK1ZK?=
 =?utf-8?B?VUtteDdmOHAzNUdVOURsRjV0ZWdGSXkzRWZXSHUyejVsT3lITTMyQmp3UGxF?=
 =?utf-8?B?V0hRUElQNmttQnZrLzM0UGFOaDY2dThxbnZLQlZ0b2gvdk1mejdpTEpoZWtG?=
 =?utf-8?B?amZDUnFBYXFqRW10amt1ODBJeUZPT1FRa2tod3JISUg5cUZJRWlwUzluYWQ4?=
 =?utf-8?B?SklKdVNnMW5DaGRaQzBTMlJGdmp2YSs1WVJHZ1diOUNiMTBuakFGTjZrL1VW?=
 =?utf-8?B?SmlBamFodDhHTjhQSXpDM1FaZHZITmlEYmRHRmJzT3JFSGpxTjdtaHRPQll6?=
 =?utf-8?B?YWZ1MVloSXZmZk9oK1BKZWJFZ25iODEzVTRBVUNNZjNDZ1FkN2lmYUg5ZXdp?=
 =?utf-8?B?bnpYOWVuQTJPc0licndQcTZNOWEwaTZPWGszdlRjR1BFZkpHVXNSalllRm9k?=
 =?utf-8?B?d1B5VHkwQmhrc294TnhWbkhaNzYyVTJqSGxxSlEwZjJBRzJicWR1dmVOY2ZI?=
 =?utf-8?B?bXVzdGI1TUhoam9vWFRaVHR6M2loY2oxM1l2clk0RzdaREZXbDZiRlBRYllV?=
 =?utf-8?B?UmdJVmI5NjJtNDVVejU5M2lZK1VxYWpsLzEzL1dieVluTWRia2V1d2pncDVR?=
 =?utf-8?B?RE0yWEZQSlhocXo1aG9CYUMrR21tNkY4Y2NrS1VQaXZHblg1WXpRVFI3NG5D?=
 =?utf-8?B?VHdud3o3Z0dxa2pNalQ1US9IRzU5dVdGNFZRb0ZGY1VRTDBRK2U1Vks0RzJ3?=
 =?utf-8?B?THd4WmMyeGNRQ3hnUkhvVkZaT210aW1ONnFVa24valZqT1gzbm94YnZWMyty?=
 =?utf-8?B?UW8weXl2MXJBMkhFRVE2aVhPN3g4SnVGSnFaOHpHSTR2VktJWXFnT2Z6UFFR?=
 =?utf-8?B?Z2I3L0ZmVDJhd2QyTlllU25waUM0UEVScnNLUnFvL1pzZEgwVWE5UDBQUEJq?=
 =?utf-8?B?cm5xdU9vMTNpbDdpWG1OWHhjOVZaVkxCYXNPVUk2SlBYdmdNVFkyczlPUWZM?=
 =?utf-8?B?b2ZaMmJ1T1ZkTnowWk1DWTAvdy95blBKNTNmb241UDlGTTRNVlE5OVY0Rlds?=
 =?utf-8?B?VnducXJPWFR3aW4vQmZqVnJJRXRwOFVIb2pvS1ZQSi8rM1Ixc3ZzdXArUEFL?=
 =?utf-8?B?Rk5zNGNXMUR2a1VNMFJqemVwL0cxem4yNjIwRnZFZUlMcVVCdlhxajZtbkJW?=
 =?utf-8?B?Y0ZyQ1pocXpPVXJBNUtnanVFMWcrdjRhYUR4eitGcHpMR2Zwc001eGtvM2Rk?=
 =?utf-8?B?dHRWSHltMDR6NmFwZEVrdG9JL3Q1RVVYR3NoR21saWxrT0c0dk8ySHJxSzR4?=
 =?utf-8?B?ZGNWSUF1WUtQbUN2dndZL1AweUtsbE9PM0xoRUE2VWRma2pEY0g4RkZUcmZm?=
 =?utf-8?B?N3ZQbTlYV1pxT3dBTEx4WkhObVZBVVB0UlY1SVRWRlZFMTFEcW03a25FbFpo?=
 =?utf-8?B?bENCSHluWWhpQlV6cW5VSXpvWmFMMjNOOUN6aGt2ZlMyaWJCSVVLUUlmTFMw?=
 =?utf-8?B?VndaVWF5aXhpUXFUbDhGREMrMStLbHprWkJlVHB4SEZJa2JueUhKZmhkNXFY?=
 =?utf-8?B?L0wzQk94Z1VyTjgwbkJvU0pQSHJ3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6qBdV+5u/m3xPe2d8VfMKUIEIIBFYQMPl8suNXrbKtXy9962M8bA5EABbaGIK23KqOe0U5H8pFIeEAD0hKO1xneAz6xszB7xh4zm9nmT0eCxmt6e7agjoS4Ebhnl+7SMBg5QQ/thhSnjfB+kJ7WmFbyTP/4hC97gYIaI/cm7uJXimVDhae6InIpwj1IfXQ41ddw+qoIdYmZwo3IxBJqSKZO9HX8itj0ddeqYFUdSLYXpHNdMyM87zovqlOoRQxM2vBBBQsy2G5bQltvEQx+ruRIwBsEj/OPbUjZJ7PJ3i6tzqqbBSW7rqyELUCnCKh0DLuROsCpKNNoNVPFAKwOK2luZn/cln+WO+ydfsb6ibIp15/5xweVMimDjFwdpC3mxNuF0OCEZgnR9onV+OKcXrFzaAajdfkmLHNix8Sl7iGxyGgJQlAllUAgW7gpi3KSN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:20:48.8401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f64c392-6abc-4f9e-2c29-08de63d7111e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6652
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/6] stm32mp: cmd_stm32key: various update
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st.com:email,stormreply.com:url,stormreply.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 794E6E4658
X-Rspamd-Action: no action

This series is adding:
  _ STM32MP21 specific key support.
  _ OTP key format 2
  _ Remoteproc firmware encryption and public key
  _ ADAC public key
  _ CMD_STM32KEY support for STM32MP25

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Gwenael Treuveur (1):
      stm32mp: cmd_stm32key: add support of remoteproc firmware public key

Patrice Chotard (1):
      configs: stm32mp25: Enable CMD_STM32KEY

Thomas Bourgoin (4):
      stm32mp: cmd_stm32key: add support of STM32MP21x SoC
      stm32mp: cmd_stm32key: add support of OTP key format 2
      stm32mp: cmd_stm32key: add support of remoteproc firmware encryption key
      stm32mp: cmd_stm32key: add support of ADAC public key hash

 arch/arm/mach-stm32mp/cmd_stm32key.c | 167 ++++++++++++++++++++++++++++++++---
 configs/stm32mp25_defconfig          |   1 +
 2 files changed, 157 insertions(+), 11 deletions(-)
---
base-commit: 66891ffb14920e35abfafcae795cf4604de6682f
change-id: 20260204-upstream_update_stm32_cmdkey-c-d604d8052dd3
prerequisite-change-id: 20260203-upstream_add_stm32mp21_support-0b0ed074dda9:v1
prerequisite-patch-id: 74f65301011fc90379e04dd25eebdf3cb2a24fe2
prerequisite-patch-id: cd2da5c9e5f556ca492c91ff76ee91cf939d126e
prerequisite-patch-id: 2f2d9574cac61f21c1caedf11601b3b79806e5ea
prerequisite-patch-id: ee473859e76b2783f858e603f0956ed7644192b1
prerequisite-patch-id: 79f85d5f5eccc0a773f973c2234939916bb84ef1
prerequisite-patch-id: fe65a2b4f620e362d1a963b00c8c9cda5c4a85f3
prerequisite-patch-id: 37714354f2763227c1ee72d57626c36687d03fb4

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
