Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2i2fHnZpnWnYPwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:03:50 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6D18431A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:03:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22957C8F285;
	Tue, 24 Feb 2026 09:03:47 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013024.outbound.protection.outlook.com
 [52.101.83.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 260A4C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 09:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qA0N4NySS75lZy5c013rbifoVmwKIT9D43uQVFFP5NKojMtudFsII60gOk6X8UxoWJefvdlYO+rHioOsyVN2cCaqZdU56ejxMRhgfDVuw9T3aDLVpPIztNrwbMF8T54XYYFaY1QKbYjaNgUi7KEVdugXx6o9vCvLpvFwHJpbaN5mrb2TXQaRiSFBXdzCzzleawk7VjOI68UzL7SFKgHtbC2NgwId8hgsOLDdDmZI2dl+/dCf5ezjNs6leifcQrFitGFxgJ57L8tCznaiq30npzw6ClvXDN4o3l+TfCJEM97v0Me6RYoEPdwTG4cGx5QsBqLXlyVbrnPdSzw4wuMJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PDBTpAXxtF2BIwJgHhj/1FN0Iu3tjRieByN0emoQz0=;
 b=y+kQtyOR0L+TGEo2DK2OPZUsJzoPDEQXiYHHYnC8zV+3NUvQHcgFVLXyBpqiYiNgothb1fXVwmO3drLLecyRQvgjfNfAy5pE6iGKglYgUlnpIsrvUH8zqcqTH7+VNcmQQ/vHlg1wLYPbYL6YiIUDi3aeeXG4TIAkmTZlTs+cVilDU37y/5CBWNx8UcvQ9y5Mn2wosNpfquEzjwEaqkzevlDEN8Bk+j0cLgXMdIwOprjHvRZgZ6NA6s3SFQQaVBy8BwbxrVAm1k9+5N1PlKOq5RzMeuVub8cHCvRsZGdriEge9FxXEHOwJetvb6bQd3qGvHQbiwbpNuWSRqUx1thrTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PDBTpAXxtF2BIwJgHhj/1FN0Iu3tjRieByN0emoQz0=;
 b=Ox0NZkYQDO2IB4TZgUEgqPVvHp0h0cUu2XIBXLiCzLCC3Tni8v8V/xEZkK7xHrojOQsfsTdM3XEUER/MM/6Nd4UIFpzEXIco+vdVIdDyBMeyp6mRmkCRFJ4tMdR+p6DlzeC7CUVq61pcJu2U8SZzKAq+jG2QKVmvYgkWIKJewZ7UctRQkfTypZ/0a27hnUWsraPcgjCAPwT5lUiKmo1rfmJrMXnHoAVQ9+iUzKfMcHtvuoSPppoVbLXP0nE/+GOE4MeVB3hyv6MAz6Hdw3BsNp7k+diVAO5ytoaLG3LwknSVkO0W43fV5x6WCYX/rgs5C0AMP4kD2dQYCYvblIu6cw==
Received: from AS8P251CA0025.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::20)
 by DU0PR10MB5512.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:31d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:03:40 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f2:cafe::bf) by AS8P251CA0025.outlook.office365.com
 (2603:10a6:20b:2f2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:03:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:03:40 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:05:47 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:03:39 +0100
Message-ID: <6f9cd5cc-550b-49b3-a38e-339050447f8d@foss.st.com>
Date: Tue, 24 Feb 2026 10:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
 <20260204-upstream_update_stm32_cmdkey-c-v1-1-d95374395840@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260204-upstream_update_stm32_cmdkey-c-v1-1-d95374395840@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|DU0PR10MB5512:EE_
X-MS-Office365-Filtering-Correlation-Id: fda16003-9b28-4389-990a-08de73839aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1BzOXFnU1BaRDd4UUpVVEV3TSt2MWljbjZKa0JmUWFDZlpSQVZEcExKUmZ4?=
 =?utf-8?B?UDlxajRNd05BZFVWTGxMSWp2QkJJMDVhMngwNzMxaDZGYnlMckpyRGRDaldx?=
 =?utf-8?B?d0cxRzQxU1NhdXdYeTVwMTBsWTRhUDlvWThjUDJybVlPR2NhN1RuQmJwMGVt?=
 =?utf-8?B?MjZvUnNQcm9PVGR6VWxBUUtIcG9vLzFxd2N1U3V4MStYQzAyb3hiaW1XeUVu?=
 =?utf-8?B?dkNQbDBmc1FKV3Z1d1pyWTcxdkNaWW5tUHA5eWhVZkY0RmdiK3F0RmozRHNt?=
 =?utf-8?B?L0hiOTE4UFdGTVB5WUFuOXpZd1pzWWV4MENYWklPUk96WVpnU0o5aVlUMDZk?=
 =?utf-8?B?ZWdhMmFXYmhZT3dIbjRlVVppM09ZQjZQTjVMRFRuK2grVjFBMldSR1FVZS9h?=
 =?utf-8?B?S1R5M1JXRU1vTUlBbkw4SzlzMmY0ZmliQk5PeTlvMEo2VnExU1N2RFFMck41?=
 =?utf-8?B?V2ZSNkVDMXhUN2UzM2VwYk5uYVRXR0pHY0J5NFJlUVFLM0c5RkZTOXVpN1Ax?=
 =?utf-8?B?OHA5eWppVDNDZ2ZtaER4bGV4M0V5MVVtTkx3VHdLWGo0L04vL251b21ickNx?=
 =?utf-8?B?NUFSWFN4Z1RPRXJNRVhuWTJONXRISlJYVVlZdE5PSUZmVFQxb295dWMzOHh1?=
 =?utf-8?B?RElUTmN6QWhHNEZidVp5YW9CaEMvQncyYUpsSktKNVhqOGpEbXRpMnZ0emVE?=
 =?utf-8?B?REIzbVhWMXBrV01EbkE3QzNIOGFSTmpCMjZqOEtiVWMvNWVnSTB1SnRPVHdJ?=
 =?utf-8?B?Q2NYNmk4VUNMOFlXUThybUZJRFd0ZHorWWJOMzVRVWZma3NkRjM4ZWhXM1lR?=
 =?utf-8?B?YWVab1RFV21hNHQxMjdIRWdhVmNlQVVUZ1Z2dE1vd1U4M3NYdGFHOWIyUmRz?=
 =?utf-8?B?NWZDWWw1SzZmM012UWQySVdWZ0laMEwwUFd6a283UUZQWnE2My91VnR0V0Z2?=
 =?utf-8?B?am14dW5IY3cxZi9kREc1NmZneHNyUUZuSUhpUjc5OGI3VzNUN3BUWnRnOXNl?=
 =?utf-8?B?R21rOUFkQUp2QUMyVXEzbDEzM29zYm1UdXlyQjM1eWg0L3I5SklDTTl2N2dp?=
 =?utf-8?B?dGpOZ1d1Y3lYYnRqa29ubFBHdnl3MjNkWTA5Z3daVFZ1cTFSUWpUUkFXa2tS?=
 =?utf-8?B?UlplTWZGSUtYWGJodlFJSGZmdmQybHQyQU1CUDR1amRYRmRUZHVRbVU3Tkc4?=
 =?utf-8?B?NXdEMWZhdUZ2MXhRelNyakYweVVrOXVGTVREZHIyOVZVam1kNFdvL21XQXEr?=
 =?utf-8?B?ZmI0dWhoMGlSaHkzb2xPU01TMkYyZ25WMVlST0ZpS3FQcnhVUUM4VHJ1elpL?=
 =?utf-8?B?ZXRKdFZEZ2EvS3ZwM0g2V0RCOWRkK2JVSUpxN29PanNHaTdTMWI5WTRiTUlB?=
 =?utf-8?B?SEdUTmtBdWZwdE4zWEJPK1I5dXVyTG5Ib1RvN2NYY3l0aU5uTVFWeWRxbnBU?=
 =?utf-8?B?ZHRQcy9Hc3Z0WWNHTTVMdEFwSzZtRmh5bnNYbFNVeS9oMnk3T01ZMWJTNFBV?=
 =?utf-8?B?d3laU2RVTllsR3ppSVkrWXdjUWdrc2JEbCtlK3hqT1c1WlA0VFpTOWVjN1p5?=
 =?utf-8?B?aHdWOWJQUkNkdmg2K2pnbzRuL2F2bFVqSmxMYzJiL3BZM3UvMlA1YjNWZlF4?=
 =?utf-8?B?NzZMYzlPR2M4Qkc3ZDNPQ25CVFVxQk9jOExRZVRnOTdnbWFmdUhRQk0zMGh0?=
 =?utf-8?B?Y3Y5aFpSaW1lb0hPY0hmNVhIaHd4V3RmS2Z5M3IwcVROWjZwWDUwN2tYL1hG?=
 =?utf-8?B?dzhwdytzRXJncGJzaWNTeE9uWGlyZmpzMTVIM0RUUVJHbHByQ1pTaWdKS2NQ?=
 =?utf-8?B?SlRZZjJGR1BvVmh6cFdrZi83TVo1cVp1VTJIQVBValFuZHhPU3JVRm5PMjhO?=
 =?utf-8?B?TmNJbXRMdHdGc3ZpOE9RTjNZT3NIMXV6aFRZajdDaDRGTjM2UTBWQit0emt3?=
 =?utf-8?B?RGViOTgwWk5WQ3JUZSt3ODR5VXQ3dFhOamxvRXpKbERCTXR2NjJlbkJhcVhD?=
 =?utf-8?B?ZGlsUkpTek82WTkrNFF5dHgvanJCeDEwWTlIcFMwTzY4YVNHeW9YdlI4SUlR?=
 =?utf-8?B?TEFOU3huQ3hERGx1YklNK0kra3JCUFhLdk9sRXp3OUNSYnFBeWtPV2YrVUN4?=
 =?utf-8?B?dzh0VW9xb3Y5SlkvakpqU21oS1lTV0tNdXJkdEcvbmt6OTZ4UGRSVU5ib1Ra?=
 =?utf-8?B?Z2VhbEIrbG1teWxvYStPNmZ4a01Fb28vamIzbTd3SU44OXpVRTlzTXFMamRn?=
 =?utf-8?B?Qlg5eXhtaElzSEMyd2hBQnlMdkpBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EBJ7E+iYkF8Cc69zauyQ9uozHJeggNGhUp6jrhnWZhMWSB8voCS2FPjDErFHQXF0+OUJBEGtp9qTy7jKU6KBcSLGxodAmahHAJBPiSUhg3IbtlIz/1dF9QGANlNvir/FD1lFNT5/7PXxc+xwcGOvVaZusQpqOTyx4rlBW5UnNtJJAtarWt/IHdGxrde8lx/Y4VHcO607qp0VyHTq+kvKaEiNohg5zZpMOFDwii/LnCK0U04k1Qt7rR7kBqWKivAEuWEOeVFNVSuHX3bQBDn8NGhbzH0vlYFx9RANPEBp3NcypHj6RhxHs5UpS4oN7Yn6xx/kNEWJcs4dtTL6rSIpPpZyEicAM4J/pxr4K6g0LZN5hsWd/n7T0q3nMXYQZaAe0W7H7tKVuNG8Yb/oO7aK7yRUyK0iYpvzKPL73IGJXl4IuzVGWLPwijMiOrXex43S
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:03:40.5462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fda16003-9b28-4389-990a-08de73839aae
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5512
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] stm32mp: cmd_stm32key: add support of
	STM32MP21x SoC
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
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:gwenael.treuveur@foss.st.com,m:nicolas.le.bayon@st.com,m:cheick.traore@foss.st.com,m:lionel.debieve@foss.st.com,m:yannick.fertre@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AB6D18431A
X-Rspamd-Action: no action

Hi,

On 2/4/26 11:20, Patrice Chotard wrote:
> From: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
>
> Update stm32key to support stm32mp21 OTP mapping.
> Create a new list of key to support the following differences :
>    - STM32MP21x SoC support 128b and 25b FSBL encryption keys.
>    - OEM-KEY1 and OEM-KEY2 used for authentication are in different OTP
>      from MP25 and MP23.
minor "from STM32MP25 and STM32MP23"
>
> stm32key is compatible with platform STM32MP2 (aarch64)
> Hence, use unsigned long to handle argument addr of function
> read_key_value() instead of u32.
>
> Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/cmd_stm32key.c | 97 ++++++++++++++++++++++++++++++++----
>   1 file changed, 88 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index f1e0a3e817c..1ceb640e6b2 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -40,7 +40,7 @@ struct stm32key {
>   	char *desc;
>   	u16 start;
>   	u8 size;
> -	int (*post_process)(struct udevice *dev);
> +	int (*post_process)(struct udevice *dev, const struct stm32key *key);
>   };
>   
>   const struct stm32key stm32mp13_list[] = {
> @@ -67,7 +67,56 @@ const struct stm32key stm32mp15_list[] = {
>   	}
>   };
>   
> -static int post_process_oem_key2(struct udevice *dev);
> +static int post_process_oem_key2(struct udevice *dev, const struct stm32key *key);
> +static int post_process_edmk_128b(struct udevice *dev, const struct stm32key *key);
> +
> +const struct stm32key stm32mp21_list[] = {
> +	[STM32KEY_PKH] = {
> +		.name = "OEM-KEY1",
> +		.desc = "Hash of the 8 ECC Public Keys Hashes Table (ECDSA is the authentication algorithm) for FSBLA or M",
> +		.start = 152,
> +		.size = 8,
> +	},
> +	{
> +		.name = "OEM-KEY2",
> +		.desc = "Hash of the 8 ECC Public Keys Hashes Table (ECDSA is the authentication algorithm) for FSBLM",
> +		.start = 160,
> +		.size = 8,
> +		.post_process = post_process_oem_key2,
> +	},
> +	{
> +		.name = "FIP-EDMK",
> +		.desc = "Encryption/Decryption Master Key for FIP",
> +		.start = 260,
> +		.size = 8,
> +	},
> +	{
> +		.name = "EDMK1-128b",
> +		.desc = "Encryption/Decryption Master 128b Key for FSBLA or M",
> +		.start = 356,
> +		.size = 4,
> +		.post_process = post_process_edmk_128b,
> +	},
> +	{
> +		.name = "EDMK1-256b",
> +		.desc = "Encryption/Decryption Master 256b Key for FSBLA or M",
> +		.start = 356,
> +		.size = 8,
> +	},
> +	{
> +		.name = "EDMK2-128b",
> +		.desc = "Encryption/Decryption Master 128b Key for FSBLM",
> +		.start = 348,
> +		.size = 4,
> +		.post_process = post_process_edmk_128b,
> +	},
> +	{
> +		.name = "EDMK2-256b",
> +		.desc = "Encryption/Decryption Master 256b Key for FSBLM",
> +		.start = 348,
> +		.size = 8,
> +	},
> +};
>   
>   const struct stm32key stm32mp2x_list[] = {
>   	[STM32KEY_PKH] = {
> @@ -171,8 +220,10 @@ static u8 get_key_nb(void)
>   	if (IS_ENABLED(CONFIG_STM32MP15X))
>   		return ARRAY_SIZE(stm32mp15_list);
>   
> -	if (IS_ENABLED(CONFIG_STM32MP21X) || IS_ENABLED(CONFIG_STM32MP23X) ||
> -	    IS_ENABLED(CONFIG_STM32MP25X))
> +	if (IS_ENABLED(CONFIG_STM32MP21X))
> +		return ARRAY_SIZE(stm32mp21_list);
> +
> +	if (IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X))
>   		return ARRAY_SIZE(stm32mp2x_list);
>   }
>   
> @@ -184,8 +235,10 @@ static const struct stm32key *get_key(u8 index)
>   	if (IS_ENABLED(CONFIG_STM32MP15X))
>   		return &stm32mp15_list[index];
>   
> -	if (IS_ENABLED(CONFIG_STM32MP21X) || IS_ENABLED(CONFIG_STM32MP23X) ||
> -	    IS_ENABLED(CONFIG_STM32MP25X))
> +	if (IS_ENABLED(CONFIG_STM32MP21X))
> +		return &stm32mp21_list[index];
> +
> +	if (IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X))
>   		return &stm32mp2x_list[index];
>   }
>   
> @@ -237,7 +290,8 @@ static void read_key_value(const struct stm32key *key, unsigned long addr)
>   	}
>   }
>   
> -static int read_key_otp(struct udevice *dev, const struct stm32key *key, bool print, bool *locked)
> +static int read_key_otp(struct udevice *dev, const struct stm32key *key,
> +			bool print, bool *locked)

minor: needed change ?


>   {
>   	int i, word, ret;
>   	int nb_invalid = 0, nb_zero = 0, nb_lock = 0, nb_lock_err = 0;
> @@ -351,7 +405,7 @@ static int write_close_status(struct udevice *dev)
>   	return 0;
>   }
>   
> -static int post_process_oem_key2(struct udevice *dev)
> +static int post_process_oem_key2(struct udevice *dev, const struct stm32key *key)
>   {
>   	int ret;
>   	u32 val;
> @@ -372,6 +426,31 @@ static int post_process_oem_key2(struct udevice *dev)
>   	return 0;
>   }
>   
> +static int post_process_edmk_128b(struct udevice *dev, const struct stm32key *key)
> +{
> +	int ret, word, start_otp;
> +	u32 val;
> +
> +	start_otp = key->start + key->size;
> +
> +	/* On MP21, when using a 128bit key, program 0xffffffff and lock the unused OTPs. */
> +	for (word = start_otp; word < (start_otp + 4); word++) {
> +		val = GENMASK(31, 0);
> +		ret = misc_write(dev, STM32_BSEC_OTP(word), &val, 4);
> +		if (ret != 4)
> +			log_warning("Fuse %s OTP padding %i failed, continue\n", key->name, word);
> +
> +		val = BSEC_LOCK_PERM;
> +		ret = misc_write(dev, STM32_BSEC_LOCK(word), &val, 4);
> +		if (ret != 4) {
> +			log_err("Failed to lock unused OTP : %d\n", word);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static int fuse_key_value(struct udevice *dev, const struct stm32key *key, unsigned long addr,
>   			  bool print)
>   {
> @@ -550,7 +629,7 @@ static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con
>   		return CMD_RET_FAILURE;
>   
>   	if (key->post_process) {
> -		if (key->post_process(dev)) {
> +		if (key->post_process(dev, key)) {
>   			printf("Error: %s for post process\n", key->name);
>   			return CMD_RET_FAILURE;
>   		}
>

even with 2 minor remarks

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
