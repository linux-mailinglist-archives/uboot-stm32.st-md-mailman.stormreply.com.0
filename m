Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8375ACF41B5
	for <lists+uboot-stm32@lfdr.de>; Mon, 05 Jan 2026 15:30:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A05FC57A51;
	Mon,  5 Jan 2026 14:30:10 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2FEFC56612
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 14:30:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcG0qSS+MnDMdluJd6mXgvjffsjI2CMSt04Y7n25P+eWCQ5c5V/oRT7nAnBybCRVjb0Pq/dc0W0B9d6/vXOwLxNny/rXD5REHH3lKvgS1bcf0neOxZuyNEPtvn2mmzWQejAO9i45qoA16meT0uvXrgkAUZGC/mEhkrpcnSPPvLwWW1aO8853w5INsu77UxYlJ248ARneZ8Kts+74/frDcOfAHbM7B7THKthQhDW9uC/iDkEOvMu14eccfJ3JvqRSFraDtOvGfeuV1asnTS8TOr5+SE6828ycOh6N1fr2i/3W7ttv7rk+etgFTRmIkGcvQCeV/e+gsOvFjX3maebfyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAVGqZv3wiGNCYnl1tAEzR/UV5BuN+nM/KHhfkxmF/8=;
 b=o120wVuCdagbkINWllNDzYG97AVnIR230Q9amJThrU5qdFBVnLmoSR+0QH4En/8/uQs2pnOHC7CSwKiCsv20hdOatpJgySTbELKHVZ+YYkaLyiZh3njrQfwMZxEjQgNGz1pyQcgB8Idi3DvKwx+uDIx+wiqSZuvvxns5HZrEehLgrVt9vG4NRKSKbzn7r0ZLNFLw+t5LuvTdzFQF6gT7mrG/UErS/NrZ7lBWyXxHlolC9YoyWV/MsaEJlSrPa+mYWWY/Z7tX4JG6/sxIqTZn3+uTiGkqdRVNXPyvvWzrjQTBDoOCAobYvvG6gEZgvBZL9w5pDw6R5FADN9Bp2Rzgtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAVGqZv3wiGNCYnl1tAEzR/UV5BuN+nM/KHhfkxmF/8=;
 b=d9+8q8llccWAazS7x/trj0A5LIe9srJIoJRMRwLJTfBhO7rwyMOpihI8Hx6bCRSlGEpT52aZTho7T/AKwZGYkS9Ub8X3IgDH/vdthwSgBpjLeYe1PWNmzZhgpWZQqZfX4frcqceejlS8QwaD5fMTOuhlK1N4tKZQ58PYgLVUtKbrGvdz1nmSnT2b7tdsYCZjIx2l3rBYju5/bDptNhV6ByTiSh4gO0D8FZbja6BciVPurx09uxtXLol3+abmNeUcc2vfJ5SDpnZSDe8AAFV1p3xuGaxYNTGVS7EQQmcouG9M8FesXUxAK4bix+AlDuZNS9X4+LNTZhnIGfqX5oHImA==
Received: from DU7P194CA0028.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::12)
 by VI0PR10MB8554.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:234::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 14:30:03 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::d) by DU7P194CA0028.outlook.office365.com
 (2603:10a6:10:553::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 14:30:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 14:30:02 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 5 Jan
 2026 15:31:15 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 15:30:01 +0100
Message-ID: <5f0174c7-6791-4fc3-80df-62812baed40c@foss.st.com>
Date: Mon, 5 Jan 2026 15:30:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, Peng Fan
 <peng.fan@nxp.com>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
 <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-3-d055da246e55@foss.st.com>
 <869f8843-8d43-4c1f-b6ae-0116fcf64ac4@foss.st.com>
 <f6140b6b-2dba-4bfe-bdf8-11a9793916ee@mailbox.org>
 <020df345-65df-4d5b-945c-36db65428587@foss.st.com>
Content-Language: en-US
In-Reply-To: <020df345-65df-4d5b-945c-36db65428587@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|VI0PR10MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef39578-5ca7-4bcd-936a-08de4c66ea0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG9kZ0hFTlN5c0Y0WG5LRlZWZXp4a290bkhkckNMRFhkSDB0bHgwTXNZMnBP?=
 =?utf-8?B?RDVTQVBxQ2NXeFl2TVBrOWNMRDA5Mm9lR2REeWZlaDlpL0dxMVNlUmpWcnVV?=
 =?utf-8?B?ZEFUVEZFb1pFNFFscWsxL2ZGOTMwVnc3T0lHRmpJVTdSMW96ejRqcCtTcmto?=
 =?utf-8?B?NlZ3WkNLQ2h4RE9yUnJvYnpnM3BzeHZ6Vm5EZ2daS3JneUVZWW1HWVBucng3?=
 =?utf-8?B?VW9ydzlpK096MWNvWU82UG5YVTVwNlZiekNOenlPVFlXNDdpb05WZkl4d1h3?=
 =?utf-8?B?d1YyLzA1N0FtU3VXc1hFT2tNRVJaVWZ0STF0eXhvV3NuRU1JdnFzbWNrejVq?=
 =?utf-8?B?OWQ1SWx0OTM1cmpmMTFKM2pMUk5yS0dvL21LSFNscFd6WnM2ZGpld1lRN1JV?=
 =?utf-8?B?aU0vdFFKMmhUN0RuU2w5L1lmcnArOEhLUGVKbkdSN3VCWXNqbGprRlZ2WEYx?=
 =?utf-8?B?NTg2ZkthdG1QRFY0WjZrZ3dlS2xoc2RoMTlYSlRTb3NMajhpVmZSWDNoM1J5?=
 =?utf-8?B?ZEkxSEdZSUJOdTZzaVhFRFRCWmE3UTBOWkpGejFQTzJLeFdTU1JQQUQzMkI4?=
 =?utf-8?B?TFRSd0o2TWt3OTIwVlU1V21HdHQvU0gvcGxDSHU1NEM2bXB3WkswVDdrYk5M?=
 =?utf-8?B?ZDZWb3pvU05lWXF4ejlaN1pOTW5BdEJTSWdrdjlISVd6ZW1tMi9PdzhMQUNi?=
 =?utf-8?B?S1phSXQvaG9HWk1PT2JSQVNCOFJyZ2R4NTFsQjc1T211emppVmRpR0NPblZz?=
 =?utf-8?B?TjNGczFVak1yZDdwVnl6VHh5b21xb1BsRDVVcE5uMHNheHpieUZtVjBydG4v?=
 =?utf-8?B?Z1hGMkxZS0UzeG5XaWR1SkZ1L29zVG5VRTh3U2swRFpudkkyVU9uQ3hyM05t?=
 =?utf-8?B?WHlrZnhlRWJ2ZUhxNmFRVVlaZ04vdExCcGJHVy8yNHduVWZxVUVMUTJaLy8x?=
 =?utf-8?B?NFh0TXE2dDZYM3NaQVQ3T0JjTzBYVlAydUs3NjRXTDZqQUV1Sy9iVXcvN1Qx?=
 =?utf-8?B?TnZ3SllraTkzekpKS1VNaERaV0NaeU5EQlRnTUhMMGFmT04zTUI4N3loNHpQ?=
 =?utf-8?B?ZE1tV25aUkdOeCtVT3lkWkxXUlBKZTA0bjRrYVB3dWlyTXl5d1luaExOK0Ft?=
 =?utf-8?B?SE9zcVJJZTcxdlR2aUh1em9RQk5rWmlZejVBa3hYem5MSXhIL3ExaExXVG1s?=
 =?utf-8?B?cGJmSytqTmlSSy9HRmsxNlI2Zy9mL3B1Q1JUQnpjUDU4am45UFYxYXgyQ0dt?=
 =?utf-8?B?eWpYNjhZbk1WU0FPNGVLaVpSbTMwYm4yV0h0NnlGTHlFK0xXa3c1Q2JoK2tR?=
 =?utf-8?B?TDhTMEtkcHFoKzlNcHhsMVRLc0RMbEVDKzRGQVovOERCZ0t0Q3oraG9MT1pZ?=
 =?utf-8?B?dUdCSjIzR1FLM2xmci9EbU1YUVNzWWZ4UWludEVjaytjaGFnZVNrRDQ3QkRU?=
 =?utf-8?B?VmNPdEZEbW9RdjRKUGdUeEZZcDdQbnljcTJhdjkrVGdJS2lWeHhiWVRoZzFG?=
 =?utf-8?B?YUhKcmlTTDlIcDBWc0JGcXFIVmk4RzdTOUlVV1FIbXZGeHNJN0ZUQkhKdEFC?=
 =?utf-8?B?SFhyT3BMcHpkbUxrL2tCaFpwU3pQR1JuN3k1QXFlUjY0dWRrTGk3bm1xelVH?=
 =?utf-8?B?cmplSVNic2RNYS9BUnI2WVROQm9DN3ZpSFM1TUNpMitJQ0VOTlRPTWEwYUpL?=
 =?utf-8?B?MVBuS3VJMGxPKzFpUlpGS28rSlpDdEZDOEVFMEg3K3pDQkVCbmtkanNIdlN1?=
 =?utf-8?B?OEhrSThjTSt3VlNzWmRRMWI3cjM2R0VQU3BUTjNVYjFWU3NuY3NPc3p0RVJY?=
 =?utf-8?B?T3o2dkkyRURsLytxNXVWbGdQTG92U2NURDRaK25sTjBIVy9uazdjNzQzdDU3?=
 =?utf-8?B?RlFQZ0pMRGhtQnRCOU51cDRZWGFXUkdadzhpY2MyZ3MxZ29sMDdCNXFjdGs2?=
 =?utf-8?B?WVFrQ0RXQWNLeFZhL1UwakF4YnJBOW1rQ3VxMm9MOXgyWWNYbU5VTXF1bzVs?=
 =?utf-8?B?aEFRN1hiSHVkemFnLzMxMlVSb2dIcXUzYWI3bWJIdHNXNXlCa2xQVytQcDF6?=
 =?utf-8?B?NTh2MDVxQ2V1VThlSXlCb0IzWVBPUDc0NHNJeHBVelZpZkcybHRUTGVsVFZx?=
 =?utf-8?Q?+bBA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: EPtOh4I1+9+PKA/tkOz6D2tFwFPQ5uUXdCJ8ZL+wmEEiDxcU0Rfa86i9M7h7ZbNU3HS3SVEz1RQ9F0S5wSGZBXtiGXu/qRd2olPj55BIDT0kVwR8p/JTIrokaKmG371sZkzxdAeCEyWkL8IWS572WOeCMFEg+FQVUnu2wtP3vMovbVb7FPXZ4tUnb25E//2CH9hNLfjrvBpcUhLYnjBZ4aPOxohUAEzKnDdz54wUqvy1hLm51y7bXeiYxTiJxmdqzmKi4+yjqhaqxcaYhFHJ1p6JfwUqr/yQiyOvkqnIULDM/46c6evjoo/RK7JGycBuCE9Kg01zphVvMlnWt6fsV444+tjuRwyOKWfbK4tLg9bV1Wa/WgTkyx3N95LQYt4LNRnHEVE9Cdj5pt0MVhutTv6Un60Zr/uyqRgJ3gl6kmYj+5d8aY1y/m8EuIpr4o6Opbj2VBaI2M7JyxAPIbIi6OZ0awDJSGKLUtWYaLnLVXkCXOVFFdr8KqbS9dIfjSeUYeuNkROXDAkd1C+ph5NzxMvpqsrZyVZjq3qlcwHw7ys5ieYbvWmvLzp1yQrxjnb0e8TMoleAg7QZOa5n7J5GmtdVJTKE8uJ0Z9TEGz1MoxnYuPU0lnXy+Z7mtxVi+VORDDUINHJgwlQyRcxv7u4ZXwKsAtu+d4y9hEOnbYXJ5s5AeL2FETW1/Rd5miACVVj0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 14:30:02.8929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef39578-5ca7-4bcd-936a-08de4c66ea0a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8554
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

CgpPbiAxLzIvMjYgMTM6MDAsIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKPiAKPiAKPiBPbiAxMi8z
MS8yNSAxNjo1MywgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDEyLzE2LzI1IDQ6MzUgUE0sIFBh
dHJpY2UgQ0hPVEFSRCB3cm90ZToKPj4KPj4gSGVsbG8gUGF0cmljZSwKPj4KPj4gc29ycnkgZm9y
IHRoZSBsYXRlIHJlcGx5Lgo+Pgo+Pj4+IMKgwqDCoMKgwqAgLyogV1dERyAqLwo+Pj4+IC3CoMKg
wqAgU1RNMzJfR0FURShDS19CVVNfV1dERzEsICJja19pY25fcF93d2RnMSIsICJja19pY25fYXBi
MyIsIDAsIEdBVEVfV1dERzEsCj4+Pj4gK8KgwqDCoCBTVE0zMl9HQVRFKENLX0JVU19XV0RHMSwg
ImNrX2ljbl9wX3d3ZGcxIiwgSURYX0lDTl9BUEIzLCAwLCBHQVRFX1dXREcxLAo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBTRUNfUklGU0MoMTAzKSksCj4+Pj4gLcKgwqDCoCBTVE0zMl9H
QVRFKENLX0JVU19XV0RHMiwgImNrX2ljbl9wX3d3ZGcyIiwgImNrX2ljbl9sc19tY3UiLCAwLCBH
QVRFX1dXREcyLAo+Pj4+ICvCoMKgwqAgU1RNMzJfR0FURShDS19CVVNfV1dERzIsICJja19pY25f
cF93d2RnMiIsIElEWF9JQ05fTFNfTUNVLCAwLCBHQVRFX1dXREcyLAo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBTRUNfUklGU0MoMTA0KSksCj4+Pj4gwqAgfTsKPj4+PiDCoAo+Pj4gSGkg
TWFyZWsKPj4+Cj4+PiBDYW4geW91IGdpdmUgdGhpcyBwYXRjaHNldCBhIHRyeSBvbiBESENPUiBi
b2FyZCBpbiBTUEwgPwo+PiBJIGhhdmUgYmFkIG5ld3MsIHRoZSBTUEwgZG9lcyBub3QgZXZlbiBz
dGFydCB3aXRoIHRoaXMsIG5vIG91dHB1dCBvbiBVQVJUIGV2ZW4uIFRoZSBwcm9ibGVtIHNlZW1z
IHRvIGJlIGluIDMvMyAsIGlmIEkgYXBwbHkgb25seSAxLzMgYW5kIDIvMyB0aGUgYm9hcmQgZG9l
cyBib290IGp1c3QgZmluZS4KCkhpIE1hcmVrCgpIYXBweSBuZXcgeWVhciA7LSkKCkhhdmUgeW91
IHRyaWVkIHdpdGggREVCVUdfVUFSVCA/CgpQYXRyaWNlCgoKPiAKPiBIaSBNYXJlawo+IAo+IFRo
YW5rcyBmb3IgeW91ciBmZWVkYmFjaywgaSB3aWxsIHRyeSB0byBoYXZlIGEgbG9vayBhdCB0aGlz
IHRvZGF5Lgo+IAo+IFBhdHJpY2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
