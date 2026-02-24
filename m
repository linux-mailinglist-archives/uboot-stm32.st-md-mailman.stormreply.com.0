Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPXdNlvXnWk0SQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:52:43 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 850D218A179
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:52:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41C43C8F28A;
	Tue, 24 Feb 2026 16:52:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8ED6C8F289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 16:52:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wD8nr6OE2XnOrkTH1cOnn7ov95Kr/x060hWrwpIQmJwfLlR6Phb96MAHrvQ1FJ0kio9QluWL3bz2/9cXNFq4GXpxU+Q3SGLCNA/OJSn5fDRbrRppQKnq1RXTqab7H7IZUlEzUtyHY4NdW/DZfb8wTdvHyxqPnvF1YV0yRKOo/aSvfViokyKT5BKSRt9FJY1qggVyl8noteAxpFqVVgM1P5jOo393DmN97d1IIWXb1fede3CIGy3otZP6GwzydDiLxSGPo03xVkAP00r9HPPSMxCumwI9kyhbrJ47ZPgSBL1U8+vd/giyht9rp9PDtIX7GMUgSDs9uQvza9sOz27TyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vsSV1GiaSSrIS6yyotZyVgqgWAYZASa91Hq5/6iMxg=;
 b=HUdm0KOl5gWjrDdNA/kY8onT/13K/M5hDkI1I81CuuHyjgGF6snXBlA/wtoW2rBh0irM/TBqp2Fd3JyRouirI5hXbSKURM7ldAWjgOxXpcGWOiWJ6B/Y8m/VKE7D2ENfCGhwehuq2TN2PNDlKgfERoVKl96Apv8EV4JlYvC1Dybj+oVz6X1qpg1I+nXMv3pM6sYfJsDQXjEKH3af1DouHW61U4iyfKQ96OU/0s5AeZURW2tu+f2Xs1+wdhn9KfO2yJBVH8PO7CV1SNjpWUYfRedMCXzezqZYchZ8qjZyxViaOqfy54IlehcwyeQh7wbfflUyD/aQDAtsxsRhO9gA4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vsSV1GiaSSrIS6yyotZyVgqgWAYZASa91Hq5/6iMxg=;
 b=ZC7s0WPU3XWPZlgVyWa+yj6/zoNkoy36EVY98pVGoq31lrBJj+lGH3Jb9SrorlBwQHMYk6DpWCtk5VfWIAn/7EspIgsOznDelJwswIpshufHQ4Bj/qROli01hjBfbL+LVXgjFKvGq+Xb1rNyuy10hseVkWTjdElwCI+yNBfA9KLWHf5loF9NHW6HD1zKKx+3ejWLIeLyIrqNJGDqf9xzsxy6z2fZXjmRMfs0knkLgIgE8crX4+r8HlZbRh7Ab2P+dLWVqSDsCztgloZrr2TD8SPpNOjCcOp8mZTeo+ZwksCfqJuICqCKy19fLRPIGoUMrqWMJJHxDIgT82/o8xe4ig==
Received: from PAZP264CA0070.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fd::13)
 by DB9PR10MB6691.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:52:36 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:1fd:cafe::b5) by PAZP264CA0070.outlook.office365.com
 (2603:10a6:102:1fd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Tue, 24 Feb 2026 16:52:35 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:54:46 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:52:29 +0100
Message-ID: <91be3123-bce5-42e0-9ad6-889b3fabbf3d@foss.st.com>
Date: Tue, 24 Feb 2026 17:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260210-upstream_rifsc_update-v1-0-74c813fa4862@foss.st.com>
 <20260210-upstream_rifsc_update-v1-1-74c813fa4862@foss.st.com>
 <8122b9fc-6aaf-45d2-9682-d62197074572@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <8122b9fc-6aaf-45d2-9682-d62197074572@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|DB9PR10MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: 0770c005-5c16-4052-3e6f-08de73c51cb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlQzQzlIQ3BVWHBtUUkweG9yZjVsdXQwbzZCVjBMN1NZOTEwbHM3THVTZlJI?=
 =?utf-8?B?TDg2OHhZdXRZYmwwSjJMUUtoeFdKUk9sWjh4aWNZRWplaGt0REpTalpvS09U?=
 =?utf-8?B?RHJ6TkZTZis0QnlhalRmdnNKSnVUNldCbnBBR0J2VFJPb3ZrUWpMdSs4RnRU?=
 =?utf-8?B?QXVUaUdBR3ZoQURyV3hoSjdudUx1TzJUQXNTZHI5eWkvNUYwRU5HcnJLVlBp?=
 =?utf-8?B?blFyYzdlWW16eUYrWStQVmNQSVlUQW9zY0lveDFSMnBmQkhBdGhyMVhwNXB3?=
 =?utf-8?B?am1tdy9xMnh6QUFEVjRYanlOWTZsRFpYZ2pENDNpM0J0UWNIWS9DTGhIRWpx?=
 =?utf-8?B?eXJ1SzhLVjlSWDZhYVk2dWRicVVKcUdTR2dLZ1RVK0ZEWkZFRkFOanFZc1cv?=
 =?utf-8?B?WGhDc2xvd1E4Z3hwZHQrMUlDeWpwL1djWUttNy9FT1VBclpKRTNVMU9abm9i?=
 =?utf-8?B?ZmhTRXkrUzEyY0tsOWI2U1Z0Z0VFMkR1SGpaYjlWTW1GL1BqM2Jwd3BFcUlO?=
 =?utf-8?B?MlNaYncvVW1TYmRXdE5lcmhhSklFbURuUFdLSTZUQ1MwV3kwdDNCVlZocTJn?=
 =?utf-8?B?WGh6OFppcWRROW02dFN5Sy9aU3ljUC8yWXF3dUZWUG0zSW1STStQUXJ4UHAw?=
 =?utf-8?B?N25TY2JGL1RyMVIveVd5Z3lDaU1QbTNKcHpQUk5aeXZZYnowSXhIWW0vNzZz?=
 =?utf-8?B?TjRCdDFuNEZEUFhuMXdLSGh0Q2VzUXRXUlB0RnptcVg3d3NDUnB5MnNCNkFJ?=
 =?utf-8?B?c2ZTZFlxQUZSdlZxU3BtRFhXKzhndUc3cWMzWThiL201OUJ1Mk9OeVNUcUNl?=
 =?utf-8?B?Y1FTcVF5aXFMdWRIbE91KzJqZWhCSWR5WTdOVHVXWnVNOUFwQWVHU1Q5cWYr?=
 =?utf-8?B?M2o3dHBWUFQ0VVJNeUhRdWppSGdYWmtHdUtkWkRlV2J3VmdJZzJjdXNOK1Z6?=
 =?utf-8?B?a2tiZEREaWdSR1lPOFl3SFIxU09sd3FmKzJJM1UzNG5xZ1RSd0ZRVmEvWjBN?=
 =?utf-8?B?aUdsZHpmUElNa2YrWVRhMkZyN2NPWFYrUC9Jb21RaWNJYzRUT2RnQ2ZkbWx1?=
 =?utf-8?B?WFZsbXI5L0hwL2VsRU9lT1RsakxBK2FieVRxRTg5VzBURmpaZWwvYmQ1YjRG?=
 =?utf-8?B?U3pUclFLODcycmRlalFpY3NOVCtOVG16TnFHTjlaSWF3clFRczRQNENmdFAx?=
 =?utf-8?B?emYzSlBCQWx1Rk9GbVF2VGxJN2R1M0NLaU9OK1lZeHJ4OUpkWEhZWU1NR1ll?=
 =?utf-8?B?ckNsYXVGY2laT0lkUjlVVFdhZ215RVU0WW00OUhidmpiVWxWbkNhdzhEZG9n?=
 =?utf-8?B?c21kS1BiNGxFVDN6SXFxWXU2YS9xTkZCMmRPMjVnRzUyRkpEMWl2TnlibFUw?=
 =?utf-8?B?MlVjM2JvNGhXMXNHUmR2bE5QWmNKaVI0OXJQZmhnK0QwSDl1SGdpWTZaWXFu?=
 =?utf-8?B?ckVueXY4TGgrbDRwMThXZnd4Rzl2WjJ3Uk50WEd0RXpibCtZZGQ4cS8zbGpp?=
 =?utf-8?B?SEs1Y0VuL3JEcE1xS1dxdEpvUHlDVW9KTlErR1hhTUhkT0d3MnRIOGVFOS9G?=
 =?utf-8?B?VzlkR2o5dEtPdzRsbHFpOTlWN210QUF2Qlg5dFIzUnlvYjVKcG8zcXhldHFt?=
 =?utf-8?B?ZGRpRC9HQVNJUjNOVjhibmZTdHVmdTh3VTF3Wm8vSGw0ZTFhcWlmVis0WUxE?=
 =?utf-8?B?WVhYYi9TajBKSUVKdzRmSk01OWZZYlN6c3lUU1NnTEI5bDNPN3g1MytVOFUz?=
 =?utf-8?B?T2FjRFpNSExMMGJkVkM3akVwVWRMVU9SWDIrMnY1TExHL1REZEVydWpmdkxt?=
 =?utf-8?B?bEg2Q2VJUHN3QllYYVVTR1lQaGhNek9qZ3Z1Q2JDN05qclhGWE83OWJwaWVm?=
 =?utf-8?B?NVZiQ2Y1WnFoV214RUF3NU1pQU5ERnFyaUk0bG5RUngyZnQ0R2dCZkV5VnE3?=
 =?utf-8?B?QmZKMzl2OUFVWklpc3NXajNRODNpRVpBeHZ2UVhNd1dTMGtzWThSZVBzVEpz?=
 =?utf-8?B?YnpucUpHaU5Zd28xeG53UjY4MVB1R0FTLzJrWEVON0ViYmF0b1NaNWRCL00w?=
 =?utf-8?B?bHFHLzhCc0FyNVd6UkZORmpkQnpaWVd3b2xRWlYwL1J2ZUJTSkJGNWR5YStm?=
 =?utf-8?B?UkxxTStiK2VzZk5Fa3JUMVJQNzc4Z0tadUVHalIxMkNNRk96ekJubDcycFdK?=
 =?utf-8?B?dEpQWFhUUmVXNkM5eDdwYTFyMUM1MTNmNEppbGpqQldyN3BpaFZHMWhBY2xs?=
 =?utf-8?B?V0NoMEtvRUxoRG90RDRKK1hlU0hBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8CmrsAYv/zIB6Gn7so9+4sORun6fmJMjNx1yfKj/EmFRPCkp4yT3cJtM1buhAoog/2dopooGgVASeiGVf4EacN+zSx/7D343Ur2xyIs6wtgw7grKIAzo7Cq/LSzXzTTYclOIC9igfE+SiGI/KaFIDVbKQCi0i6VbOqojLpXb0LTVIGhP7uqemX4FHnE9rqL8Icx688kP1pq46jU2RVa+TlbWPdlEuQ+xUNFSCaDxbnbd4sYUswMA/ESSe5vs4N9RdcjmfDLy0Knv16fjtWhRiWOrkmKXiprkJ9iAaA3HJDDzQ+TbPkIH295T/mS2bSb75ozujFgyISFEbD5Ef2ldmOHl7vhkdKRhX6fsE/xTjB5RVP3MzUHOG3v481XQ8pNCwuyOEwRFnDIvdPbxX6B66Soi7Fn6JPDZbBEC4cDmzNeusPOe0LPi7W2TDwb9Slmu
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:52:35.9763 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0770c005-5c16-4052-3e6f-08de73c51cb5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6691
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] ARM: stm32mp: Add STM32MP21 support
 for RIFSC bus driver
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.332];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 850D218A179
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDExOjI2LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvMTAvMjYgMTE6MjYsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gQWRkICJzdCxzdG0zMm1w
MjEtcmlmc2MiIGNvbXBhdGlibGUgZm9yIFNUTTMyTVAyMSBzdXBwb3J0Lgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4g
LS0tCj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9yaWZzYy5jIHwgMSArCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL3JpZnNjLmMgYi9hcmNoL2FybS9tYWNoLXN0bTMy
bXAvc3RtMzJtcDIvcmlmc2MuYwo+PiBpbmRleCBmOGY2N2FmNDQ0OS4uY2Y4MDI2MDg4ZjMgMTAw
NjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9yaWZzYy5jCj4+ICsr
KyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9yaWZzYy5jCj4+IEBAIC0zNjcsNiAr
MzY3LDcgQEAgc3RhdGljIGludCBzdG0zMl9yaWZzY19yZW1vdmUoc3RydWN0IHVkZXZpY2UgKmJ1
cykKPj4gwqAgfQo+PiDCoCDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IHVkZXZpY2VfaWQgc3RtMzJf
cmlmc2NfaWRzW10gPSB7Cj4+ICvCoMKgwqAgeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjEt
cmlmc2MiIH0sCj4+IMKgwqDCoMKgwqAgeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjUtcmlm
c2MiIH0sCj4+IMKgwqDCoMKgwqAge30sCj4+IMKgIH07Cj4+Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6
IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhh
bmtzCj4gUGF0cmljawo+IAoKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpUaGFua3MK
UGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpV
Ym9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby91Ym9vdC1zdG0zMgo=
