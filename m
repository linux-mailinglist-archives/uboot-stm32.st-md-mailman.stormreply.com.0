Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A18BCC5E4D7
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:45:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53C10C628DA;
	Fri, 14 Nov 2025 16:45:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EEDDC06935
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:45:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGgd4P3043344; Fri, 14 Nov 2025 17:45:06 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7kktjc-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:45:06 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ge+7t13viPXV2csuavOChI8dpSTjIR3kCBj2XHSpS1+hauPY/oTwTkFncfaCKOjQnsTNvpC7QVf7prRG28r/L0j0NKzuG+KOxGMDKv1mMybIgBIGKhwVexOpE24TA637lIdAIA60CmAXXFf7KbwiOUBBq4bgEz3wkstacheQRaDHesIrp7tJTTpeUjCUVvpZWgjv1LX6eyirWov25egVgNU0D0Xcfm3CKIyQ5ApirfvS/iDcJYMrbydDpC1to5lZAiuqxDeE+D0dm3+7sP/N4CV15bNV2GknXRacXzZOGHfjjZjMQ8WiRUhZUuK1cgZcPjKYSTXEer4JA3sKNS+vQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxN+yA0C5l+yqItnQhR/7gYYhubKkJkQgvKlaSQI6xw=;
 b=CtIXtDlEhjq+LR5ml6CkanyzUhxAXSaxto7ZJMP8ZZmXYrirHy1g+GvdU5JbfbUfkXDBrG/iaxUFj4Jy88K2xEaKYsZAiIHStGmeAk+COA6Sr+a70Vzr9B5wYx+c3OwifMNDvgAli3SnEyhAP0xoqcb+8tNeMOh9l1rYXGLCzlh+hWYn//GHb+4fW5nEa0OzDJZtDUX05MGqnUFQZpJKs0VuYUPqb3VbsqjJvX4G6B2nh23zuJC9WJvzuRYHX5UFBkmT0nprZ7PQuBrSDbfxWxrQ5TnARqvebuzRC2SSkFlWUX8TNpcHWJ5qQkdDmhAq9NUUMWAe7Dzp2bx9G1kfrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxN+yA0C5l+yqItnQhR/7gYYhubKkJkQgvKlaSQI6xw=;
 b=YxG+Po6gJUhiY7zChmEDlgk2U5CcoxJuHldy54FNLqZej9pUcGZsjYfcd3Gne3O9B/PCuqBKeFOoftZp+dqa78DRrlzZhjYMRPc6WV600y2BQd0X7Ep2l706irE935cNUjrjdsqu4xbjA0kgyfi1410JwKjXgERZ5Gap35GlpbpurECCI4J1u3OHWUfW9yFlojsXVQNH6Qllio1xJbNcCLpZaIXaGv5H9vCC12BpDOPAGzNCN0/YTjVau3qHkn6d/2bjpg5ebAGdNYjpyOwvebeDtQ8PfV3ZEijxFhwzR4wP89RGSx0U+G6MB5lGcQDk1sZoKZ1eYdMLJEu0p2E/rg==
Received: from DUZPR01CA0200.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::10) by AS8PR10MB6923.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:57e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:45:03 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::b6) by DUZPR01CA0200.outlook.office365.com
 (2603:10a6:10:4b6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:44:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:45:03 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:45:14 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:45:02 +0100
Message-ID: <f96c99f5-c78a-4a76-8d0b-78f669c22e3f@foss.st.com>
Date: Fri, 14 Nov 2025 17:45:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20251017121852.109561-1-patrice.chotard@foss.st.com>
 <20251017121852.109561-2-patrice.chotard@foss.st.com>
 <4afefb55-b8da-4a2c-90b5-a188662c7181@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <4afefb55-b8da-4a2c-90b5-a188662c7181@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|AS8PR10MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5be2f9-c022-4f69-06e9-08de239d28f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmcyQ3hmMGhBTFdhMzd4OUJUUWgwZ3ZHQm9DZDRBRUlkSXQrOGtScEFoZ1Vk?=
 =?utf-8?B?SUhsMjhtV2w5S2h0WklGaTJnSlZiRVJFRVdGSEJrUUt6L3IvSDluVm1sa3lZ?=
 =?utf-8?B?c015aW9tT2tVaXgrRHVUdE1zNVkyb3ZtbERCQWNsTXpxK3I3T0FDdzJ5Vk5p?=
 =?utf-8?B?SFZzNjgxRDhUci9CUVh2S3hYR093RXYwbHM3bkRqaHlwZXpqd2Y0U3RxRmY4?=
 =?utf-8?B?R3dtZy9NVHJma3VGSGZWV29ScThCNTgrNjVNRjg2MGNzUnc0NzlMSzFRd0Ji?=
 =?utf-8?B?Z3JNdk83cVg1Y0RrWGVmTVY0QUc5RXd3Ny9nL1dUSXJJTmVhdmZEaXY4V013?=
 =?utf-8?B?NVpMRXRoZlpzOWsySVlBb0ZPNDZ4NGR2cEhucXZ3NTkwQjE1NVpYUy9qY3BI?=
 =?utf-8?B?RE53SHRRbUJBak1iY0krQ0tKVGhEVFFoNEtqNUtZeGdlV1dUZWNZYklhN3Zr?=
 =?utf-8?B?SFZWcjBUN3hpT2RkemxRZEtzNDRoYTZNTytJRlhYaE5YRGNrcnAvY3I1V3Nk?=
 =?utf-8?B?dTRNTU5rd2FLT3phOHNxUDY3NzFzTEtNWW44RVg3Q3ZyblJnOU93MEZMTEtr?=
 =?utf-8?B?bzBlbkIrL3lHbmY4MS9yVGd1eXFMNVpPdDBmMnZIOW1YUE9NUmp5SnRsVFlR?=
 =?utf-8?B?Yjl2MHFCVm9vdGpzMlJGWmw4NUlreFF1ckt0NGhUWktBTGFOZmsrRHZtSmhM?=
 =?utf-8?B?SCtsZEdQQVNsQ2g4YUxrbGVIcUVCQk5lRmIzeEljWnhHR3dhRG9Rc0h5UE9x?=
 =?utf-8?B?UnlURVRwbnBkL214SkR0TlRuUGtMOWszb0JZb2pPUE9oVGVuTThBOURnNWRJ?=
 =?utf-8?B?TkUzWWFzUVY1RHdIcUlyOXN0SXR6NGQ4amY5ZGg1bkVJRFJydVUySzVtaXVP?=
 =?utf-8?B?cTBuL0kyc0dnOWgrSWswbGs0MTlacVNPYkNyZ1pUdTNSdDFBenNQRnc4UUtE?=
 =?utf-8?B?b2xFWm02UkNDWDN3Q05BMURSTmc2SHU2Y1BudkN4TnFTTkV1dDdQMEdMZENF?=
 =?utf-8?B?TWxPZ1pkeHZuZGNoUEdkUFUyekpkQnNkdHdVR3FDSGF6dEc4cWhpWXJIb3dx?=
 =?utf-8?B?Y2J1STAyYVRGWnd6bk00WGZwS2d6anYvRUQvRU5iQWVoRDI1QkxHM2tOdVZu?=
 =?utf-8?B?cEhRaGtraVV5czRwYW9GZC9KZU1NZTVtdGdFNExYOFEvVHZpQWozNVRMbDEx?=
 =?utf-8?B?alpVcS95ZGo3QzJiNVBVU2JBenV4VGtEcmY5ZXV3amI0R2ZkRllrK0w4em9n?=
 =?utf-8?B?UkJHWTJWYXRIWXJqS1p1bkJpbHk4K3ZrWmt1b0w1Y244WDlVZGtWK2tjUTFV?=
 =?utf-8?B?a2JucWlDbmYyZkdxaVlka2xudEdDMXpOMXNJY1BRdkFpSUNxVzNJcXd1ZVU0?=
 =?utf-8?B?YjVQRkpyQUQvYi9kdzlOQzB3bDdBWTloeXBycG9qSm1jMEVMRGJNM1FHNHhT?=
 =?utf-8?B?TUFyNEo4ZE9MdEpHWGE4SlVuWU5PZXNLMGRYTUp6TWY2aDFMcjVqclg0K1VW?=
 =?utf-8?B?K2JvVFNmZm1TQUladXdOQURkODdxTCtnYzlLaVZ6Z3VJcjl0RmtsSEVIWXNE?=
 =?utf-8?B?aTN6TWNmYWJBQUxYYWxxUEUrSEtlSGdicU1ybFhLRS9GL3k0MHp0Y0ZKRGNa?=
 =?utf-8?B?R2UzQm9pYy9nRnE3ek5NRlRad0ZQYXNUTWZ3YVVlZE83SGZvZTdhaXNuS1BN?=
 =?utf-8?B?V2hqVy9JU2xXN0dzUWxwSjkzRVh3MGUwaGQ2V0FYQWpuaWtOOU9WNW45L0I1?=
 =?utf-8?B?K2MwYktVcjYzMUo4NmgwWmpiYTd4OGw4WmE3ZElOTnlra0UxUU9ycEdMbHpQ?=
 =?utf-8?B?VGIyOTNTY1N5VVcyZCtXN2ZmNFNQV2RadkxoQ2krZDRBa3cwWXM5V0JIN25L?=
 =?utf-8?B?K0pDRytNTzNocDNUelRxNTR1UmtuWVpncDVrRkNScWZvSnpieTR2NzdkOG5N?=
 =?utf-8?B?dXpla2VKbHdDYmJVSDR1UnBLWitvRmU5eW9jcFY4ci85eFY5Q2EwMW5yRmoz?=
 =?utf-8?B?VkRzS0ZlblZCT1JtS01TTG9xY1kyUUZQVTVBYU81SlBGc0JtNG42TkgwWFhH?=
 =?utf-8?B?UVNzK1JROWN0eFVZazRaNlI3ZVJ6ejZzYVd4YjdCR0ZMTE03bmJBZHp5SmJl?=
 =?utf-8?Q?qm2o=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:45:03.6024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5be2f9-c022-4f69-06e9-08de239d28f5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6923
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNCBTYWx0ZWRfX1HaP4F1Tk6Hv
 nxoB5qLbGRqsw4vpxWK/oxzan0rqyVCLcEcXL6tf5wDfPzL8J+XCvN7zapthuewEx6pyTQSup2V
 dWoj1GrlBjXdo2+wJaoEVxCLK6whqm7xWvfoPSBawSF0MJPIi60EPRd1WNUf38hdvz8dWZ0NdOg
 jIvR4eHtouiP1kdVpgFktkxFqJJA3RKN92I1FKeMi4xacN7LKq0J7GtSDggmFBFGE2MAAhN96p0
 8cecHjvWhCEkzgc3EUA0JmSndx7xi4c4J/3v1GOb5mMOoT3bSh9J7SW7r9IQfSgcj0zXumh3qiV
 veiz0Y6H8ZmjfbpKdN/6/6SekZb5YuS7qAcDNNyexR/xMcz2VI87TfEdo02AC5juNXyfoKGnrX9
 iUGdO1G10LVIEZIRiimucKWWBtZUeQ==
X-Authority-Analysis: v=2.4 cv=Xsf3+FF9 c=1 sm=1 tr=0 ts=69175c92 cx=c_pps
 a=67JRAVsqNSV96jld/LUi8w==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=nNBQClDjZUG6d9zj5SgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: VFaRaiYJGdNBD90Q6vg-sOe2we1Hy7wK
X-Proofpoint-GUID: VFaRaiYJGdNBD90Q6vg-sOe2we1Hy7wK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140134
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] ARM: dts: Add
	stm32mp257f-dk-u-boot.dtsi
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

CgpPbiAxMS8xMy8yNSAxODoyOCwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBP
biAxMC8xNy8yNSAxNDoxOCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBBZGQgVS1Cb290IHN1
cHBvcnQgZm9yIHN0bTMybXAyNTdmLWRrIGJvYXJkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRy
aWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKg
IGFyY2gvYXJtL2R0cy9zdG0zMm1wMjU3Zi1kay11LWJvb3QuZHRzaSB8IDI2ICsrKysrKysrKysr
KysrKysrKysrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPj4g
wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9zdG0zMm1wMjU3Zi1kay11LWJvb3Qu
ZHRzaQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAyNTdmLWRrLXUtYm9v
dC5kdHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAyNTdmLWRrLXUtYm9vdC5kdHNpCj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwLi5mZTNmZTljNTE2Ngo+PiAtLS0g
L2Rldi9udWxsCj4+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMjU3Zi1kay11LWJvb3QuZHRz
aQo+PiBAQCAtMCwwICsxLDI2IEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vci1sYXRlciBPUiBCU0QtMy1DbGF1c2UKPj4gKy8qCj4+ICsgKiBDb3B5cmlnaHQgKEMp
IFNUTWljcm9lbGVjdHJvbmljcyAyMDI1IC0gQWxsIFJpZ2h0cyBSZXNlcnZlZAo+PiArICovCj4+
ICsKPj4gKyNpbmNsdWRlICJzdG0zMm1wMjUtdS1ib290LmR0c2kiCj4+ICsKPj4gKy8gewo+PiAr
wqDCoMKgIGNvbmZpZyB7Cj4+ICvCoMKgwqDCoMKgwqDCoCB1LWJvb3QsbW1jLWVudi1wYXJ0aXRp
b24gPSAidS1ib290LWVudiI7Cj4+ICvCoMKgwqAgfTsKPj4gK307Cj4+ICsKPj4gKyZ1c2FydDIg
ewo+PiArwqDCoMKgIGJvb3RwaC1hbGw7Cj4+ICt9Owo+PiArCj4+ICsmdXNhcnQyX3BpbnNfYSB7
Cj4+ICvCoMKgwqAgYm9vdHBoLWFsbDsKPj4gK8KgwqDCoCBwaW5zMSB7Cj4+ICvCoMKgwqDCoMKg
wqDCoCBib290cGgtYWxsOwo+PiArwqDCoMKgIH07Cj4+ICvCoMKgwqAgcGluczIgewo+PiArwqDC
oMKgwqDCoMKgwqAgYm9vdHBoLWFsbDsKPj4gK8KgwqDCoCB9Owo+PiArfTsKPiAKPiAKPiBSZXZp
ZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4K
PiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL21hc3Rl
cgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
