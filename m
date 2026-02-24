Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGmLIxyonWmgQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:31:08 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F35187B50
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:31:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC5F3C8F288;
	Tue, 24 Feb 2026 13:31:07 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011044.outbound.protection.outlook.com
 [40.107.130.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF15BC8F285
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:31:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+4p80AEuGYatO1dZ4pFbZ4Qf9uzQ83UW90AZumdFAPAEqLFVJVtz/DtuoDH6HLvZm70lmZxcylN/Ti75J4a8UwYrRVo1GYxDS+aswuLq2zZ6tda5ykaZqhqkgVJ7R1mNylUoSxCGoTd3hXeDcuRzzFX6YZHaDSjrlpY2JT5aMgk29kQq1EN2GBJCwrSBXg4oIdAquwZEtY/R9+BPEULhIh3sRAnZQjDHDlTYTDwFaFUdsUYU5a7gZoggukHh+rARU+pox98cKdfr3D5nra+7cMjlxJ7KwcHtk5qwEyzKrvR+WTWWX4u0wgmWUj0POdUERnDeaHKUnNB0ALWxyFhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyurBVKTmxMt1xpinAuBhwZA/4JUQ35sInnGJG8LjgY=;
 b=gATby1wvA5bJtB6QFzQ0csPncpPZ9jkAo/H/pj2yfD9pOf9m3n+u74VBU3PO4tMpgTRP9TfFjMF2frV/wRoY1KM+ny/y4lkWFldd5YLPfpJNMRXAO8YQl9yIUnJZIM5psKQyZdod1tF28Okt3a0p436ASUOKoUQvl/G93pg8rL8i7zlyk6WoqGU65EyH/OmIUfGryDk5Y4Y6twLHJJMxPQx7nYeEWenbQeDGwwM9WP7OoWQevmkPytSmsM/sIg5rJHfA/4F8+e9bYsg2g0U5lzPYA/hAwR15nef8qnqkTCDIv/Xd4R89+dtk2DNaz83VM7hn7YKmovXom9IppJxrag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyurBVKTmxMt1xpinAuBhwZA/4JUQ35sInnGJG8LjgY=;
 b=QI+iFl7wnqXSZJxvmTAETVgJRWggzMiReObNytphwQl1HtmgeGHr218HriHO7/cGJn9kd3qv7qcwPFZqeu3K3h0gs3ui+hu1upvQtXqrkp50kli0EF6GhVxxD62mi3h+eyhWMZWKqJbdcygL4ouG8YhwR0ilQI0KqSzbRNZa8ApFj7HlN5xSHsccrKaSx4x9BnZbSDjEbRrm83hhKQda7SuRm4w7xL0L2XNPbcB6n13+/+EPL5syvefaU7p5WeubhX72Ky4GwRTWNB/14u12H3rVJyAOiZrzg/4UuI762mWi21TkiotnwulYzxPkiWZ2X5GB461EycayUtxaNGttcA==
Received: from DU7P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::21)
 by DB8PR10MB3465.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:31:03 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::c5) by DU7P250CA0006.outlook.office365.com
 (2603:10a6:10:54f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:31:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:31:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:33:19 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:31:02 +0100
Message-ID: <2ba24130-21c1-494c-816a-65d702cc6de1@foss.st.com>
Date: Tue, 24 Feb 2026 14:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
 <20260203-upstream_add_stm32mp21_support-v1-6-48ca3409cce1@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260203-upstream_add_stm32mp21_support-v1-6-48ca3409cce1@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D05:EE_|DB8PR10MB3465:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b73972d-4b1f-4a53-ef98-08de73a8f542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXZLUzAzcWpGNGFsYlRWd05xRStvVjdZMlN5Ri9OdEhHbWplNitCd05kYVdh?=
 =?utf-8?B?K1N1SG5RRXJPSGMwMEJia3JScWxGeWRWR2VEMzFvS1FVbWFxTy9lOEtobXBi?=
 =?utf-8?B?Q1V5aEZBSHQzZkpoZ3lzakMxb0plVHVBaUFENDRjMDZPRm00US9EM1k5Mmw4?=
 =?utf-8?B?WWVtYlBlUXdEWjE4REZXeWVWbU9HWVhhMjBvS082WCttd2R1SmJnY3JQYWtO?=
 =?utf-8?B?aXBSaURUY2VCRGxwbmM5U29yRnNmZFVUWnJnYlVrREJ1c0RkTnFPVDJIZzI5?=
 =?utf-8?B?S3RWdUN3VkFYRy9YMlN5eDVaRzVRdFFMT2NSazZvWUwrY09HOTlPOHp3RXpi?=
 =?utf-8?B?N1V1MWNmOHRuUWY3UEdUNU1xY3VOVlBEVTY2bGxzY1FIREkzZVpJNjQ1R0l3?=
 =?utf-8?B?MW1xUFZRVHdLZkVNckZNVGl1TVRIQ085aG9QdE1FVzdiZFRLVXloaDB2ZXhN?=
 =?utf-8?B?QXNZVjhHaVB2V2JSdUtiRzNvMzljZ1JEcWpqdWxCWmNUUTRiRzNab2JNUXpG?=
 =?utf-8?B?ZnAyY21iRG96Rllyd00yQ3h3TWhQb0J1TEVBT1RtTmRlSVFkdTFuL0hXYTlt?=
 =?utf-8?B?T2FSdWJJS2tXWmxGRXRlSG13YmNtYjRMMHNmM3B2VVlhZ1IvQXF1QnVCT0V6?=
 =?utf-8?B?MmJ0OGg1Z1lwdHVjV1NkMGk3bEtNSTNKVURpSGlobXZPeFdYVUlUbSt2V3gv?=
 =?utf-8?B?NHBYNUU2ZzRtUnpsa0pscXc3bWdxS2lXMjM3UjJSSGpReHhQd2xmWERNSWN1?=
 =?utf-8?B?MEZOM3R0Z2lpcmZlbkNpeHNqYkc0VE10c2pjUTZXajVGV2xTdTc1ay93c2dW?=
 =?utf-8?B?Wm5xL0FUM0FBWW5iSHR1Z0dSL2dFZWhKdWNBTlpQV3h6OXFOdjdOZ2RBejdV?=
 =?utf-8?B?MkgzQ0VZRGdjTVQ2VVRyWHZDOHhFK1ovRUxndXBVSGI2cGdWWEdRTnBIMDNN?=
 =?utf-8?B?eEZHZHlQb3F4MWMrTGRCejJXd3QwS2FUUW1Dd2xzWDk2bUxxVEFBNG1UTVNU?=
 =?utf-8?B?dUJJZTZtdTU2UURrbHYzckhoLzZERnUwQStwK1k5RG1JempnaWZaV21SbUp6?=
 =?utf-8?B?UTdPN2QwMEx3b1k5RWJLTjhaTjViZ3p5KzE5NDUyVlZNeEczejUwdlBjN2FT?=
 =?utf-8?B?TlJOVVlsSFRMcUx0M0JZYXpKN0pFT2NZc0FaRU12L1VtcnNHbCtwTUFGeFRT?=
 =?utf-8?B?bGlHNm5YSHJYMmdxdkFacVlLa2Y2eTBMODVCUUNiSjBnWXEzVmRRMHVDRGhs?=
 =?utf-8?B?aXlGNkhKRDBiTU1SR3d3UVErL1gwRW4rY0kvRHptRjBtbUZOV0QvT3NPTmI5?=
 =?utf-8?B?TVJIY3Z4Z2tyTHN4eGNiY2c2U2Y0cWJTZTF6WnRaWCtIbTQ3dEFGQUh4UjY4?=
 =?utf-8?B?dkNPcG85d2psOGs4amJEMDM4SVEwVmdJRlphNFB1aEp0aHVDR0ZGWWd6SFNR?=
 =?utf-8?B?OGJDRXVseDA3RXZIOTRZUEdwZ01EUUhlMUF4QWpVSjRsK1FtTGk4aGhJTHlp?=
 =?utf-8?B?WiswZmFaL1JPb0JjTkJCejBBS2pJZFkyb0lRTDBDb3M2a1F1OExNNDBaUnho?=
 =?utf-8?B?OVNReGN1bDcxd1dXQm9yVlUrU3RLWWlNR3FpVWo1ZDhKd3FVQmlKWUs3bWNx?=
 =?utf-8?B?bVZWMHJuQjFlR0EzZEtpd1BJWmFZaTRJaGJoOHoxSEZDbWkzQ0lvVmQ2TlNa?=
 =?utf-8?B?eWpVUkQ0NWZ5em4rTy9hbzhDbjBVZWkvYnNmNXZqUGw4ZjVibVFqOXcxUUFI?=
 =?utf-8?B?OERDdWZ0RHg5dE1Sa1FmYVNSV0xWMyt4b3pKSGJjNmlDYTl6ZkJ0Q2k0Q1Ev?=
 =?utf-8?B?dkVGb3c3WnBib1BnbUtwcS9vYWZOMnJ2dmhFaUhtcEpiMjRTMXZWSUpZNFpx?=
 =?utf-8?B?c3BFYWZlVXJyRXdJc0JWRkhtcXBaZWV6YXV0RkhBUHFGU29FVzN1bVhtcnhY?=
 =?utf-8?B?eXcwUUE4OGM0Tms0TzFIaHhUQXlCYXFEclZ1YlNsb0t5c1pNRWxyU2NhU1pp?=
 =?utf-8?B?SzRzM2VxWmJNMk5nSkhIeUU5RmRtcXhrUmVUdHFNczRRTGIzM21pNE12ZWZo?=
 =?utf-8?B?UFNqUWszVngwL3YxNCt3SzZza01yZDJ1MXhWL204M3dLUU1VMFRQSTJBSHFZ?=
 =?utf-8?B?MXNuTTZ1R2hyWVlMNGxaZnE2RU85UENBWDl1cjdyclpPdlpBTjQxOFBDUGx5?=
 =?utf-8?B?dkxwMEtFRUhFUkt5WDBPVFlCWmhlUU1tZHRweVEzM1pwajdBZE42U2RnOEtZ?=
 =?utf-8?B?M1JWdTdnK3NlSFFYL3B0RzAzZFFRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rJXAWRnYj1OhucaXzwP+vK+VKyF/puX9wa0m23r0LxIfQZuU0i+AY29DGvysHE++D0JilomZ4r94AiCudLAFS9CR/vySTcZeQDoyG0WZ/Io1jFns1wQJb43siNHvZ976BF3MPrltSI2nGzrNcXkAz8txocp06UReySn2yAIYBPbvyPOZmErGyhhWFaahqGtSIK9GxH5nbYPAtk7LAuMzuGGfmlxdGAyTBdFk1Y0LWQcQzhzRpyh9bmSTvkTbS8fz1jgAOlsEf87KcNP83gqCpyb+jM+aRQKFRwR4BE2BOzdpIUIBIxCyJw3MBdH9/dal13jwLluNgXxoPkoaZ8zjxW94jcVWq2g2ocO1yL+yPE3l6szEeFpEO1O9rR8gP70lxae4gtjp6Gw3TIKKek85b6Uttv9xQnO+IMwIa83J6phNAs05+ekw1vQdbuNuLr/m
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:31:03.8567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b73972d-4b1f-4a53-ef98-08de73a8f542
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3465
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Cheick Traore <cheick.traore@foss.st.com>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 6/7] ARM: dts: stm32: Add
	stm32mp215f-dk-u-boot
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:michael@amarulasolutions.com,m:marek.vasut@mailbox.org,m:quentin.schulz@cherry.de,m:cheick.traore@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:fabrice.gasnier@foss.st.com,m:nicolas.le.bayon@st.com,m:lionel.debieve@foss.st.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,foss.st.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.842];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38F35187B50
X-Rspamd-Action: no action

Hi,

On 2/3/26 17:49, Patrice Chotard wrote:
> Add U-Boot specific file for stm32mp215f-dk board
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/dts/stm32mp215f-dk-u-boot.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/dts/stm32mp215f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp215f-dk-u-boot.dtsi
> new file mode 100644
> index 00000000000..e4b44af6df9
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp215f-dk-u-boot.dtsi
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * Copyright (C) STMicroelectronics 2026 - All Rights Reserved
> + */
> +
> +/ {
> +	config {
> +		u-boot,boot-led = "led-blue";
> +		u-boot,mmc-env-partition = "u-boot-env";
> +	};
> +};
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
