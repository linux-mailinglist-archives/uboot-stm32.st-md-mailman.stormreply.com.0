Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD68B59C34
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Sep 2025 17:35:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F830C32EB5;
	Tue, 16 Sep 2025 15:35:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6CD9C349C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 15:35:51 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GFXEnD011092;
 Tue, 16 Sep 2025 17:35:28 +0200
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013013.outbound.protection.outlook.com
 [40.107.162.13])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 495j64a8yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Sep 2025 17:35:28 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfdMUM8KD+iKLZ18gEVRTrgKqYIRezdG7bTQlkZSgjFBTPGedwgtET/oZSlZOFjdFTzumtXmz8M0XecrlL1BedHlYAoghIoW/h0TmjJyPz42tpWXKVofCeez0glEanOXP1fHJn6i2S4y0uMXYd1Mwp5G9V60KdW/ar2eWoIDI3HBFh0IElWDYm+7P2OkybutHHDjJyaF7h8JICQVoOiCYn/rqlztJ/izKFxWb5s/tRTxDJ3NsfDjpX52jQN601CsahuxHcdjHT5gt+uxpNig+5W6Dp5bY9kvwUnzv11LmiKa0FDXm7pvIeYDQ/WdLaHB01ZLq214p/XNbbFT34nv0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hw2vQ3MbogWFAsT2RgdnH1mgjXVcTBooWBb8iTU8XFU=;
 b=ogB9d15mWcORel9+Itg9FSgMe5JFtbvhnsfiLDziyrl3Nf+alzgBeWi6plhgxcmF9QaK3Gm1YA3xUXPzpjd0RAmDY1ee9X91rylT+pwvYyhHvMt/AxR5/dwXi3Dh2/eiT2ZVlaAXCTYroCJuggFm5PpNOfXbN/yONfoniTk+aBCvlx9zHGVOX72iNXC5wAr33CMWfBLSKYNxw6c3uUTOVWpnLe3O+JgWpepYZAXAxmxuB4PiC4zSLThLgOY04LIqOFYThVHW4BTH1tbAS9Z/KcrbyCWlNJD9wqM40dnCcaCZsz065S4u5S6kgjJrqxQ3LDG4bHvwV5nnPXSEPl+o0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hw2vQ3MbogWFAsT2RgdnH1mgjXVcTBooWBb8iTU8XFU=;
 b=mwum7gxYdjZC2+X06oFWTosDc2oeqcIqZIn5pHX3sLCm9TvH8M+gGsWgMC4O3zMajyWDqMArhCPNMxDlnqHHqIrF8rGz/8NwzJ+b8J7VuLr2L9sA84JFbkhYyV7dZr+7SLM/sQtzTV/bh22UQ3kCUcogeXF9aFz6BsLgtxxoMrtmWrSe8WbRSpxXSp74rEDZH2lcYBu10VRghK+j1VAanLbbCboNUiDg9Sq9P0Pz2s/k9Mx1a0CHPUT2v3cD7j5AaKIbk3rfvCprKzfDHIzD/U6A2Siz/Rl8C3lCot5L8+VlGGfg9mfjHmLPlq42au325q1O4ZjCoJU/8SCUXRkOLw==
Received: from DB7PR03CA0075.eurprd03.prod.outlook.com (2603:10a6:10:72::16)
 by AS4PR10MB5845.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:510::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 15:35:23 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:72:cafe::1d) by DB7PR03CA0075.outlook.office365.com
 (2603:10a6:10:72::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Tue,
 16 Sep 2025 15:35:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 15:35:22 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 16 Sep
 2025 17:32:58 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 16 Sep
 2025 17:35:21 +0200
Message-ID: <dd90d6d9-4649-4ddf-bd15-db06ff6991cf@foss.st.com>
Date: Tue, 16 Sep 2025 17:35:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250915004915.222325-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250915004915.222325-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D12:EE_|AS4PR10MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ac0b7b-28c1-4a79-1480-08ddf536a68f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUZzbHhDcDJkSW1NZWdPeHp4L1JuSnNkMTlRWEFLWGhkUGh2bXZPTFBOOVJU?=
 =?utf-8?B?NW11WFk3SkVsSTZvazY2VUhvLzdJekkzTUsyVUdkTnJCbi8wYXhsNTZmL3pC?=
 =?utf-8?B?WGllVTZCb3lsRkhXQWNrbmtHZFlKMEFLaHRWa0t0bkdyV095RnhNVUVGMjNY?=
 =?utf-8?B?ZUN4bmRyS09QMlh2SHhjVEZyYVRxWm1HT1JRVk1wRndFSW4vYzd6U1UrV21G?=
 =?utf-8?B?TEVvb2UzSHpZYVpqcXNOTFJBZmIrRDZBaDhmc3NiaTdnT3paNVV0UG5xbmcw?=
 =?utf-8?B?WloxYnFVRjhDSUlZbU5VRHhEMVpmekdVa0xJSXdDdGxadDVmV04ydmJNVXVM?=
 =?utf-8?B?a2RxVnptdTVOdWVlUmx0ODRDU2toUFZyaThwMjU1NWd1UVlaWkgvOHBKZXVw?=
 =?utf-8?B?ekREaVArU3dKRXZqWnowMXpheUhZTncwWGQ1cnVCOXVJV2c5MXNjNG1VU0lm?=
 =?utf-8?B?cE1kU3EvNlFkTG9HTnEycnBJdEVsZWtGeTNUK0RNaS9wRGFJWXlsbWtjbVNv?=
 =?utf-8?B?TzhSMHZoNkVkUklpVUxPdzY4WUI5R2wyOVJaMGVzV2QvY01VN3dFQWNXVTJL?=
 =?utf-8?B?QzdXVzVKOHFOZDI3aERPTnFhaUJrNXZTUitubnlwWjVxcmhJT1pwSzJuY2py?=
 =?utf-8?B?dTBRbVRqamJxcnk1cTV1bW5ESVFCRTVUaVYvSGtBSHhiWXN5ai9HM3dyOXoz?=
 =?utf-8?B?UFVUNWhsb3FjMk5GTy9SWnVhcEc4dU5McVRrNlpKRHpYU2Frd3V1VEwvN3h3?=
 =?utf-8?B?amExYVpQYVRjbzhEV0VYNTN2VUEyb0NpMmxOVjYrd05sbStzSjBMYXVXaGY0?=
 =?utf-8?B?N08rL2RyOHl4dmszU0ZPeTJTQ1kzY1RQbklTWCt4ZVBVUVl6YmlUMm43ZENP?=
 =?utf-8?B?WW0vU1cxcWFGYW5rK2pGZGlnNDB0b3hkd2dkZmlNcjRoUW10dEY3RHJzVVpK?=
 =?utf-8?B?ZTFFMTVDS1h2YzRuNC9qTmVtYnZoUjY5M3NZM0hENk43amVUVGdkRnNaUm45?=
 =?utf-8?B?WkpmOGVFWkwwKyt6ZzNXenpUY1FWTkxGQkRPREFyUmVJeVZtM2g5UU0vZ0ZU?=
 =?utf-8?B?cGhqdWkxWEhZb0NFTSswQlYzSGFvOEhMb2ljUFhBL0dMa1dYU2lXUk9QSk1Z?=
 =?utf-8?B?alJLN21TQlBtTWJkdGNZS0NXTTZvcXh6anhaZXU4KzdNNHQ0UlpHbjczY24y?=
 =?utf-8?B?VHIyUmpyVE9jRWFPTE5kbE9Mbis2dnlJYjhmZjZ5WkJFd3JHa092T0hsZWFv?=
 =?utf-8?B?bVdmL0d1YXJTcDdUd2VBb01udkpOdUp6MXRjYjlwczFRaFJCWllia0xhT3ZB?=
 =?utf-8?B?aDRGRCtKUU5TczdTVWVZRWFjVGlmWnFWNW1JWEU0NFlWaGYwK3g0VmVjUGQ1?=
 =?utf-8?B?cUI4TXVyZFBmalhGd0dOb1NNSlN2TW5DWkcrYTZla3NocGN1d1JlM25hamVB?=
 =?utf-8?B?dUk1blVvOVhnZUswdUR4ako0MC8zdlN3ZWIvS21CRDlOdUpUZXIzMU9Vbmxx?=
 =?utf-8?B?emZLSWZFbkdhUmNuN0VwSU5pdUhhT3VVNVcvbG5YcnA3NStTdjRsK29wZkY2?=
 =?utf-8?B?TURwRkgvcTZWc3RrM09zSlhmc3FDL0hDWUZFYTFYQkJtUEpyaG0yQ1NxVFp6?=
 =?utf-8?B?TURMK3lPZ0NPMFNwd0FRY3BuT1hyZ202YTA3eFZYMHdtTVo3Z0NHWVREREkz?=
 =?utf-8?B?R2U1d3kwZUUva1VqcmEremZNNXhqMjVnUkYzVkxOV0I3WjNiRzZTWDBPbWo0?=
 =?utf-8?B?QjJSL2Zlc0lYUVlFQ3E2U0FRYm9aOFR3TTZyUElLdDBobnF0Tkd4bnk4OE9R?=
 =?utf-8?B?Tzh1UTBLY2NHU1ZqVlRPKzV4T3FibHVnRWFiTEE0cU9ycUgvc2ZINmJSZk5i?=
 =?utf-8?B?VFRMeDZRYkRBcGZBbVFJRXlLbVRiRjZSZzFad09NSzJjMEVwdG5BSG8zbG9J?=
 =?utf-8?B?RmxGbFRGSGlDVmhGamFKcGxOcTA2WlROL0pSYStUQUxyd0RSa1IvOVhhVWlO?=
 =?utf-8?B?VXhYYVBFMG4wdzhmNGx1eFpjd2Q5U0t6ZGRyWHUzUWhzb0N5a2RaRUd3eG5O?=
 =?utf-8?Q?qSKT/h?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 15:35:22.6759 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ac0b7b-28c1-4a79-1480-08ddf536a68f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5845
X-Proofpoint-ORIG-GUID: -ya2jN87G3COPvvqGFEt512MTqC2CIvW
X-Proofpoint-GUID: -ya2jN87G3COPvvqGFEt512MTqC2CIvW
X-Authority-Analysis: v=2.4 cv=Xq/6OUF9 c=1 sm=1 tr=0 ts=68c983c0 cx=c_pps
 a=KhE4gu946QIFSMZrge1Egw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=b3CbU_ItAAAA:8
 a=8b9GpE9nAAAA:8 a=cm27Pg_UAAAA:8 a=k-42gJp3AAAA:8 a=zk4-lHRcAAAA:8
 a=phlkwaE_AAAA:8 a=JnDzDxmhS7MFY-s632EA:9
 a=QEXdDO2ut3YA:10 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22
 a=uCSXFHLys93vLW5PjgO_:22 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDIyNSBTYWx0ZWRfX/aA68iNnSdRB
 a99ZlpimwA1bRF8DA8TbR2S4U1JmF1mywtdrzpSsFMRsBuyNSQ4x3o77aL2AhQsvMZHVq3E1Ijq
 sqORytWjpHv80wZAxlzvaHxXcrcsG+ncG3oW1edtFvOxBZeKNqZ2EHRDQWVR1rfGfOCtlBS+K22
 +1OckvQLhmSffPeC+VTREsqHzh4+O5Y4DvK+DNleI+tr+c/tUUdqhLzNUWlZCfi/3H39XVrZdUr
 YYcaLHr0ku48QkwfsDnldoGsdB8xKV4GNrm5gxEJuAbovvvoPbZENLH71xyJ5q4H+L6DhV2QlTO
 okguIMaOy3vnYjcKqeGWZj6Jq2JzHgHaans3bjMPlmrVkGp0nAeH/C2cOu/7IOpJoBBav30AVN/
 595UPdtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1011
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130225
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Perform node compatible check
 for KS8851 early
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



On 9/15/25 02:49, Marek Vasut wrote:
> Check the compatible string of ethernet1 node for KS8851 very early on,
> before calling uclass_get_device_by_of_path() which might initialize
> the device and possibly attempt to configure MAC address into device
> which is not KS8851. Doing the compatibility check early prevent this.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  board/dhelectronics/dh_stm32mp1/board.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index a15348ad7e7..551094b9489 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -85,6 +85,9 @@ static bool dh_stm32_mac_is_in_ks8851(void)
>  	if (!ofnode_valid(node))
>  		return false;
>  
> +	if (!ofnode_device_is_compatible(node, "micrel,ks8851-mll"))
> +		return false;
> +
>  	ret = ofnode_get_path(node, path, sizeof(path));
>  	if (ret)
>  		return false;
> @@ -93,9 +96,6 @@ static bool dh_stm32_mac_is_in_ks8851(void)
>  	if (ret)
>  		return false;
>  
> -	if (!ofnode_device_is_compatible(node, "micrel,ks8851-mll"))
> -		return false;
> -
>  	/*
>  	 * KS8851 with EEPROM may use custom MAC from EEPROM, read
>  	 * out the KS8851 CCR register to determine whether EEPROM

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
