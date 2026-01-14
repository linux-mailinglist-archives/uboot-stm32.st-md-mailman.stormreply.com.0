Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A05D205BB
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Jan 2026 17:55:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A4C3C8F270;
	Wed, 14 Jan 2026 16:55:34 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CC93C8F26F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 16:55:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4FqUOq57mCXiaHea/jWVPg/jjQwEtNq/KYvhEyD201IGW9yoN4IB5wbAnjx542vGc1IVJYKs09gwcDEu1+hZGTxm85Givyp6cBR6kBcPt/NZ1W9regxEUvTc8E8tpDE8wIxeNIxpO3k3nrd2aXSSU1BqxxCZpVR2X5n5mJsuMPVjKCE0eggsJTvrNEfoPCyEK1a5gpZNWKguFD6jI8019680uS3zrM+g3IJobi4kA2z7VuHUjOixUiSrdviASCiWVoLvR3XPpxNHHi1og+zxbOafsIO1gRqW9zdBmmb4B4UT8stZiS4FcFUW/fZaH9kSJ2AOZOZoXEYI+DJ0xro5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vN2Z6Lxjv5C4GgVW9nf+t4+SckBRW/zX2qWWMPoyz0U=;
 b=pF5B+I/WdL6vKeMnIWNfMh11JdpWz/u4/IWxBp0yCM26lgkkzHmvLpBNDwXae4UIPbPkbjByL84jBgnh8B/zcL8RNimErHk3M/1zJmZ314cCy6RsTJVBy4AcpmI6pr0Tpn7n1ZBU8c0u0E8sfRm0vPtKcI5D+hF1+Yt1QYFEDhzDHUOrCuYHA41iuxMfUw1ffQlq4UT2JV/3Kbndtmyef2k4SCe+8fil80Kx+YIypO48Ti0J1uNL0IcGgI+dOL+r+bJwQxhpRM8A6RVSnStT0MaFwR37yIrAzYIERUvtESi9ddtoVLuZTgVGW88nkfn9dnWjTJwe1gO0d3gmpjOu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN2Z6Lxjv5C4GgVW9nf+t4+SckBRW/zX2qWWMPoyz0U=;
 b=SMoMUeX5/wzY3fT2+bWYGusGnp+E0yU0Y1T65ylMGbvKBfo9SFlxdacK814x5XnK17mclwdVTz+rLI06UhiGFZPj7ayT9NQHibCglyt+Y3SmU3KTYvIGTe5dawLyJOeaFixB3+0XOLg/viF1Ce9ZCXXCvk40EJqml1rYUM431K68weaYLgVUvH3MXfleB13MGKt5GTNh8piUrfufkVgs9cJjYRHYfysepsxY7EQgP/wAbUSrL5534xdjTCLJkC/ynfGzRWZ0q7GM7uZjnXDcWtc35G5P0OBgwg+Ze/Zh++5jociRALRdoC/nszL0U7d6ZhfMu+UcyGsIkh/mLvnWPg==
Received: from DU7P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::29)
 by AS2PR10MB6685.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 16:55:28 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::fc) by DU7P195CA0006.outlook.office365.com
 (2603:10a6:10:54d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 14 Jan 2026 16:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 16:55:27 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 17:56:52 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 17:55:26 +0100
Message-ID: <cecb567b-289d-49b8-a9dd-390a6d894500@foss.st.com>
Date: Wed, 14 Jan 2026 17:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, Peng Fan
 <peng.fan@nxp.com>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
 <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-3-d055da246e55@foss.st.com>
 <869f8843-8d43-4c1f-b6ae-0116fcf64ac4@foss.st.com>
 <f6140b6b-2dba-4bfe-bdf8-11a9793916ee@mailbox.org>
 <020df345-65df-4d5b-945c-36db65428587@foss.st.com>
 <5f0174c7-6791-4fc3-80df-62812baed40c@foss.st.com>
 <5a4ea825-3a89-4856-b9d8-d1df827f9b9c@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <5a4ea825-3a89-4856-b9d8-d1df827f9b9c@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|AS2PR10MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 0891dc7d-44d1-4fa2-388a-08de538db842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkRELzVpMnVsMTNqRzcwZFo0dDIwcDA4UTNvc2EyQmpoOFBuT0htdTdkSXo1?=
 =?utf-8?B?VHFYRGxtckovR21IQ1JkSnBYMVc2dnBvRms5ODI1cFNEamcvYU5rWE9icDJT?=
 =?utf-8?B?WEw3TWkyODRkbnVnMzRzbWdRUXJBWjNNbjhmQnhabEhWTjhqQ3pSenEwMkd4?=
 =?utf-8?B?QWpobFdPRjdxYzlEbnh0WG9ycU1PK0ViSElHczRnZG82TEQzaWxmaXRXYWdX?=
 =?utf-8?B?N0ljNS9yYkhaNjV4WVJiVTc5a1lNTmg3YUZ6SkNjZmx5b1pOcWpPNnpRM2d2?=
 =?utf-8?B?UTlOYTRxNjYxckIxWG5sckwxdFhUaFNBMGdmSzVWVGJYMHNtK3Uycmx5Mk54?=
 =?utf-8?B?cTFlM1NxdmkvNUR5dEwxNmNIMEp4QmNDTDNqVGpXR244NkxZVzhuajh3NWx1?=
 =?utf-8?B?TDhlUzI3YllMMXVkVDBQNU9ib2NyeHIybE5QYWtRYlNJVFdScDFuRXdpWDNh?=
 =?utf-8?B?QmROS0thS05mUm0zM3VKUEtvZUYvODZvc0JjWHhjZTh3c1V5WWNVTU1RYXZy?=
 =?utf-8?B?RnBFM3dtUS85WEx4ek9XNkc3RzFmSSt5OHJvNEdaUXRuQzJxa2ZWSjZycUJO?=
 =?utf-8?B?RHdRUjl4bmtVWERtc3lkamZmRFQyRGhKT09YaWlJbTZCS29oK0NrdkU0OTZj?=
 =?utf-8?B?YTBrUXdYUFZFQWVEM0dsYUNCbGIzVERhNGFJQStUcXpKcWhYSDRnSWsrcUk1?=
 =?utf-8?B?b0xFb08rbndlY2oyeEJYWVpsVWxXRWdtcmtDZUd2VDBCcjlBekI2c0xoZGto?=
 =?utf-8?B?azVPWjJkMFh6U3JUUWlBZUVnMnNUK0ZRc0dmclhQd0QxMW43MzYrQUNvdEkw?=
 =?utf-8?B?WUVnV1VIaS93TkRTWWREajNwcFVNZEZVZTBYV1JmWUhGZlBnWUFvbUxXZU9q?=
 =?utf-8?B?dVdrMU5UbytNa2xPa2cvMzh5MHZiNSt1Sy83NkYrK0o5SGU0dThSVnpqR3h3?=
 =?utf-8?B?SEtaSlIwWUpmSWlGY1RKMXI0RFh5UTJzdWk4TkovZklBUjRGUHRMUXJNbWZ1?=
 =?utf-8?B?UEVFSFZSRzdGbGsxK3c0VVhDOTl0WUo2c1E5dmNiRnRKNnI5SHZLVk5yRG1V?=
 =?utf-8?B?YnpSeHJoaENHSW5qVjVxYWkrUnIrMmoyeGJQRTQwb2hRS3pxclZQN1h5WmVJ?=
 =?utf-8?B?elBVQVhwTGhDVTYrOGVQM1N2VU9CUCtYZEhtNjFKbWFrM1crWHVGTEROUm1p?=
 =?utf-8?B?VDJqL3huRDArT1FFZFhEWjZQWVRwdkFrNHpkdmxtQndXSVZiYlNZUmZYUVdX?=
 =?utf-8?B?WWMzOGRmSDZVSzFHUmtHK0pNY2Y1RmF3WG8vN2syckRSSi9IeDNBOWE4TXVE?=
 =?utf-8?B?UllQR0ZLYkdCRklFVCtBSWhoVVhzWWgxWE1veXhBTDk0dHEzZjVuT1RJSC9k?=
 =?utf-8?B?OW9kbGRGS25JVmU2SnRscm1UMTVDWExvK0RrZU94NW1YMTRKOERjRllBdklq?=
 =?utf-8?B?ZXJoZVBZWEdSUldBdVFuU2JpdnZEK2loNDBpQ0Q4WFJMWitVL2ZTYXNHSzVS?=
 =?utf-8?B?MjNkbGtTS2VlV3plVVdTcFZnNDNmR29yL1RGd0NNU29WK1h3UVpGZHhnYW5Q?=
 =?utf-8?B?NDh4WTBqVk1MenJCYWl0clIrUHA0N0NXTjU3M3h1UnRibC9OQ01vaWpOL2k1?=
 =?utf-8?B?dmpkN2VjS0p5eURnWUhhNEluWXgrMkpDbEZiM1ZzU09GZ0lKaUpWNEtJa1l3?=
 =?utf-8?B?cjFPVFUvWTlQSjcrakRBaUppU0xpTEx6TUhrWkZ2aWF6RVJRN0JJQ3MrNFFJ?=
 =?utf-8?B?aEw2SzhxR1REanRuL2JYRnQ2WXlCN2RXUkhwTjZpWWRKaEVOaXhpVmhvWGI4?=
 =?utf-8?B?VHpHKzhYY3hhbkFlMU5GVXAvazNvMURaeThuWUdnd2s2b2c2Q1FXL25EOEFz?=
 =?utf-8?B?MVcyTFBFdXlJVXlsdHNWaFFyNU8zQXVkWFZBZ3ZGUTkrUFNqeDNaU0tDREpo?=
 =?utf-8?B?WmNmLzgyOVRyZ0NyWVJoTmQxZ3d0VjJLYzFmVkZtRCthVzJ5NjNXU1I3TDhY?=
 =?utf-8?B?RGpPUGVNdm9zbUVMdVAwcVNvNWhEem92bUlmdmFSVUtGZnVOa3ZHckFFV3Vx?=
 =?utf-8?B?THUrWE96MUkwbFlHN3hPOXRuTTk0MDJtZTI2dTYrVExSdEJUQ2M2Ulc5STJZ?=
 =?utf-8?B?T0VDUzRTOU1WTTJWTmkrS1FNOFhtNlBtUmRlMGUrWWx1VzZMYTlRMHl6ekVh?=
 =?utf-8?B?ZHhLME5iWmhob3RmN0RVY1hiYURHQVRyaWJBd3hFb3EwdzJncE9Fa1dKcjg5?=
 =?utf-8?B?Z3c5MmRsNDV4cHJraGt5NXRsVFFnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: EZTz1ejMzoMLDHotdMG9oskKHOX2S+9qSLDAlsbK2/iYvVJH3AcnLkKVqslft9IOPfQh7yza7EFXbvOsXa2H2/kLBBm+rn8JVrN0ykg4A/VgipZcqjvqrRrPp71cLMTHg7XnzHoLbpN5utCA+LEbtsaQYrATBVCuy+pNrgRk9zfCEycyjya66Vfwc67juXuupPrlIZzIgCtz4MomCoONQKTlLa7UTb/cMGdRC18JHPLB3r9S9m1oXKBHs5Oo/cdSFbhmDVGbN7OpgNgU8GTC+IM2u3fgoUMU4CStDdVMYXs9F5LIO2nmZ5gQlI2lAEIkysjqpeGZpkJHCOuX0giglFIJiarvH1Y2Nalcuc9KeErYSbVaA2XwZhfI/S2LeyNpzoQWL/fu5i2FJuo9zCuvXf+UK9rXrGGSgvr22M6C+z38BkWLSeLW2VyZq31ISt/9HqPpTmo1joyd6XmAxMGKkax9TVOlWyQUbfdibGzJKVJNtzLiIyEA2BTELjqBoJhi36S+fpThKKLXMzR3QS35vrVOsf8juGFupXeBzUO+KsJWItzbUjPY3dcbfGyMEoW9q/E9vB6rWtCFCvipxvbYUDU/B0od2UCpAnGX66VUsr9NjwQlUgVzpoSD5QEBBvHUlx3LtDxGvQI+qsyDGyQmIWGuEIiHvc3unQYNEv+jo3qacvtAbAxeNgYxqpl6DE4i
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:55:27.8833 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0891dc7d-44d1-4fa2-388a-08de538db842
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6685
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, Gabriel
 Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/3] clk: stm32: Update clock
 management for STM32MP13/25
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

CgpPbiAxLzUvMjYgMjI6MjIsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDEvNS8yNiAzOjMwIFBN
LCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4gCj4gSGVsbG8gUGF0cmljZSwKPiAKPj4+Pj4+IMKg
wqDCoMKgwqDCoCAvKiBXV0RHICovCj4+Pj4+PiAtwqDCoMKgIFNUTTMyX0dBVEUoQ0tfQlVTX1dX
REcxLCAiY2tfaWNuX3Bfd3dkZzEiLCAiY2tfaWNuX2FwYjMiLCAwLCBHQVRFX1dXREcxLAo+Pj4+
Pj4gK8KgwqDCoCBTVE0zMl9HQVRFKENLX0JVU19XV0RHMSwgImNrX2ljbl9wX3d3ZGcxIiwgSURY
X0lDTl9BUEIzLCAwLCBHQVRFX1dXREcxLAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgU0VDX1JJRlNDKDEwMykpLAo+Pj4+Pj4gLcKgwqDCoCBTVE0zMl9HQVRFKENLX0JVU19XV0RH
MiwgImNrX2ljbl9wX3d3ZGcyIiwgImNrX2ljbl9sc19tY3UiLCAwLCBHQVRFX1dXREcyLAo+Pj4+
Pj4gK8KgwqDCoCBTVE0zMl9HQVRFKENLX0JVU19XV0RHMiwgImNrX2ljbl9wX3d3ZGcyIiwgSURY
X0lDTl9MU19NQ1UsIDAsIEdBVEVfV1dERzIsCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBTRUNfUklGU0MoMTA0KSksCj4+Pj4+PiDCoMKgIH07Cj4+Pj4+PiDCoCAKPj4+Pj4gSGkg
TWFyZWsKPj4+Pj4KPj4+Pj4gQ2FuIHlvdSBnaXZlIHRoaXMgcGF0Y2hzZXQgYSB0cnkgb24gREhD
T1IgYm9hcmQgaW4gU1BMID8KPj4+PiBJIGhhdmUgYmFkIG5ld3MsIHRoZSBTUEwgZG9lcyBub3Qg
ZXZlbiBzdGFydCB3aXRoIHRoaXMsIG5vIG91dHB1dCBvbiBVQVJUIGV2ZW4uIFRoZSBwcm9ibGVt
IHNlZW1zIHRvIGJlIGluIDMvMyAsIGlmIEkgYXBwbHkgb25seSAxLzMgYW5kIDIvMyB0aGUgYm9h
cmQgZG9lcyBib290IGp1c3QgZmluZS4KPj4KPj4gSGkgTWFyZWsKPj4KPj4gSGFwcHkgbmV3IHll
YXIgOy0pCj4gCj4gVGhhbmsgeW91LCBIYXBweSBOZXcgWWVhciB0byB5b3UgdG9vLgo+IAo+PiBI
YXZlIHlvdSB0cmllZCB3aXRoIERFQlVHX1VBUlQgPwo+IAo+IE5vLCB0aGF0IGlzIG5vdCBlbmFi
bGVkIGluIHRoZSBESFNCQyBjb25maWcuCj4gCj4gWW91IHNob3VsZCBiZSBhYmxlIHRvIHRyeSB0
aGUgU1BMIG9uIE1QMTMgRVYgaWYgeW91IHBpY2sgdGhlIGNoYW5nZXMgZnJvbSB0aGVzZSB0aHJl
ZSBjb21taXRzIChhIGZldyBEVCBjaGFuZ2VzIGFuZCBhIGZldyBjb25maWcgb3B0aW9ucyksIGl0
IHNob3VsZCBiZSBzdHJhaWdodGZvcndhcmQgdG8gcG9ydCBvdmVyIGFuZCBoZWxwIHlvdSBkZWJ1
ZyB0aGUgcHJvYmxlbToKPiAKPiBiZjUzMzQ0YmZmOGQgKCJBUk06IGR0czogc3RtMzI6IEFkZCBT
VE0zMk1QMTN4IFNQTCBzcGVjaWZpYyBEVCBhZGRpdGlvbnMiKQo+IDExNDNmZDRjMzUwNyAoIkFS
TTogZHRzOiBzdG0zMjogQWRkIFNQTCBzcGVjaWZpY3MgZm9yIERIIFNUTTMyTVAxM3h4IERIQ09S
IERIU0JDIikKPiA5OThkYTY5ZGE2NzggKCJBUk06IGR0czogc3RtMzI6IFN3aXRjaCBkZWZjb25m
aWcgdG8gU1BMIGZvciBESCBTVE0zMk1QMTN4eCBESENPUiBESFNCQyIpCj4gCj4gSWYgdGhpcyBk
b2Vzbid0IHdvcmsgcXVpY2tseSBmb3IgeW91LCBJIGNhbiB0cnkgdG8gc2V0IHVwIHRoZSBNUDEz
IERIU0JDIHdpdGggREVCVUdfVUFSVCBsYXRlciB0aGlzIHdlZWsuCkhpIE1hcmVrCgpUaGFua3Mg
Zm9yIHBvaW50aW5nIHRoZXNlIHBhdGNoZXMuCkkgc3VjY2VlZCB0byBtYWtlIHN0bTMybXAxMzVm
LWRrIGJvYXJkIGluIFNQTCBib290LgoKSSB3aWxsIG5vdyBpbnZlc3RpZ2F0ZSB3aHkgU1BMIGJv
b3QgaXMgbm8gbW9yZSBmdW5jdGlvbmFsIHdpdGggdGhpcyBwYXRjaC4KClRoYW5rcwpQYXRyaWNl
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
