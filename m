Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2CC5E4DD
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:45:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62747C628DA;
	Fri, 14 Nov 2025 16:45:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A01D1C06935
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:45:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGZKKM2675354; Fri, 14 Nov 2025 17:45:20 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013013.outbound.protection.outlook.com
 [40.107.162.13])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7k3y2p-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:45:19 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QP0mjjr7X4oGozZiPbObZKRw2oD+BO5nfnTk42S1L8mLZhpAikQuLIvyuAlOtBlWioQoy61hHVI5rxDQEZvHKvkk62nFMKxusg9Mg4BJzrvbCjSAiAkMtGUq8r+A1ti/ORfA73Yol7JkEQ/fXTc1iAxinhce6vGIpMb0RLay0HAIiGsLa87DU65vlMbxMJQ4YDr+Wdxnpa+WrzrHbFCn56tToD+vSFJSdwEdbvNdRDPVRFLjrty6OX5mtsGAP6v120Bnys6biY4dU9a/SlaDOK6F3cMxD7OI5tY0JS8AYF2t8v+rU6zQmm1u1FRrQKoA+LTmtmOpsKrKy6eo1Eh2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTmEYMowNKssb9LrxrxJhj9OxXxXGFn+f3d8I9wxW3Q=;
 b=BJTDZoaY1LXlRzUuB9KgqUpdBUgeljsq2YZ2FDpHUMAiikDvN/ii998HI4J+TSwAG8rx5Vh6zgSt7peBhv8SCygLRMbUn+nJw4Lzi5PspXuJLOrp0cyS+BkfKQpXkx3JEqCUONG8hfHzdQVtkk04xfKbmj/ZCxJfrs1FsPGnJEGoeCAkJajoAzVBw1SDru9KKyLE3iCXs7sMbxS8cGAkeojq0s+8GQfd08Vi+AMPzjPDA3hgMX1zrRSTBG08rx6q2S8IHn1M/kIpRfXpjSt9IsvQ0xAhy35K+eoF3Z0aMhWBqF6tW2cstk+ABWPQLjSzQi7yTgvgyX1uFm1eJEpQ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTmEYMowNKssb9LrxrxJhj9OxXxXGFn+f3d8I9wxW3Q=;
 b=gCqkaEdHLl3Dy9vvpjnO6EhDrC3A7qUvCVlyMDyk1GpQQEfpzFDHYedJ5HbDiXspe3jQiFjMB/2rOAX377eFVYsAKEucN6ZBzEeG4U7hC7Mqrh3hYENwPob6H5rXxRb1hErQmFEohj2x5Pjr3CThn56MbEtx7fyJJsSWIj1VLwihjat+gcWVOz0HMBq6Avlgejn1nq6iJTYGSqptg1IFUy3mZrD+HcavOnTmQP41+8kJpn5KiEosQPj3YdJQkGSbjGW4O++rzRYaHDoR8wZbojOZYxhCGLpzeGTfONTiTFk0DSu7Mmn8pylcVlGQzuwnHW4Iqjk/rY6h73MUjB8iAQ==
Received: from DUZPR01CA0327.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::17) by GVXPR10MB8946.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1d9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:45:16 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::71) by DUZPR01CA0327.outlook.office365.com
 (2603:10a6:10:4ba::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:45:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:45:16 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:45:25 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:45:12 +0100
Message-ID: <54e04605-9f0b-4873-a531-ef72047142e2@foss.st.com>
Date: Fri, 14 Nov 2025 17:45:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20251017121852.109561-1-patrice.chotard@foss.st.com>
 <20251017121852.109561-3-patrice.chotard@foss.st.com>
 <eedbc5f9-8c21-4841-9a05-b457e601ab5c@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <eedbc5f9-8c21-4841-9a05-b457e601ab5c@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0D:EE_|GVXPR10MB8946:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f00965-0dc8-4de7-d1bf-08de239d30bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVBCcW1YMXlhVjYvTnUwN2VDNUxaNFNHL3lnb1hsc2crTzRhWGdrNFcxRGs5?=
 =?utf-8?B?U2gzMCt5ZnlpTlZoOTIwYnFKZWxIYUZFYmRPRVZXUkZ3ZVl3eUVFalh3Q3M2?=
 =?utf-8?B?NXZKMkZOcXVmT0VLc293cEhmTG8wVmpCS0dCczJEUm5vRnRsajFjMXBUTjlD?=
 =?utf-8?B?NHNOVU4zeTJUQTlJZE5OOTJETTBtWWtMVVJVVmxKVDVSendkZGQwWTluaDd0?=
 =?utf-8?B?ZWF2Q2g2ZWcwdGJvbCtJYldjdVlpZkl3MFVOSGFzUkFwcTlLdnNsa3prTld0?=
 =?utf-8?B?eGc4OUwwREt6d3k0MnNLdHZzL1c4NldsM3JEU1ZWSnZDUi91cjdXa01kZ0Vh?=
 =?utf-8?B?SjBOUVRpb3hORTl5UWhQeks5c1FmWFZBa2k4NDlmOVpBeEJxMURieFNtdzFl?=
 =?utf-8?B?MHdjSEYrYld2Szc3d1ZnRnN2U1dGV0Q3STA1d3lDUTdmTS8wbDhOVWhaMXlO?=
 =?utf-8?B?VGEyUFdxTjZiek9Iai9qQW5iMUhkcTdoL21HbXNpVkhpRW9wRWFoOXEvWjIz?=
 =?utf-8?B?VWVTZDdHU21tdG10Z3ZCRjVhL3hKWnR1RzNGNTIxR2tFYjFLaGVFbGZsK2g5?=
 =?utf-8?B?NXJSelFuWHFHQVdVRFpRKzFMcWsrcWx5WjJYWXM3OHFpaUp3Y2FiTU1KeXZN?=
 =?utf-8?B?bndFeVZQQXd5MFVTUDJQdldVVU1VcVV4TDFCeXdnUTgxSHJwbzVpSURWcXlx?=
 =?utf-8?B?RkJiK0pvbWdJL2ora1lmRitnU1pabHZmcDNtUXBuWWV0cy80eUFmcUdpRndD?=
 =?utf-8?B?d1I0YVNHZkgrYTdlUHlpNDFMenB0WkJoRzQxYUJBVGJZODRZZWk4OVNwTTlS?=
 =?utf-8?B?MGc0WkdZd0lHTkRaMzlYODBxUzBsQnB3SW9sdm5jc1dTOVlXeHAwaVNEcldi?=
 =?utf-8?B?OERPWGhhYXZtMlRTU1FUYTJJeWsyY2VTOEtKelhtdHZQbWJ4OTdFbkl2bmc3?=
 =?utf-8?B?Q0ZiSWEzekEzemNFUlg3NVRWQkJXNUJrc09TbGJ6NWhGTEU5NTIxakJ1TGpp?=
 =?utf-8?B?M1ljSHFBRzY5ZGNMT3JSZjg3OFBoS0tEQjJZMm51MmM0U2pNNkRnNFBYZVAr?=
 =?utf-8?B?dk52TVZrWlp1aTBCVGFHYkpsc0tPdVZqZEFqb1NZT0lodFl0WXozL2FEMzRC?=
 =?utf-8?B?YWlaNG5pS21FbGZ6TkEvK3dJYzR2SkwycG42NXVEOGVDT2dhOXRPR0tJTkd2?=
 =?utf-8?B?bmJjajF4TGNyNitXRjhZVWg0bVRTSERrb25SblJoSC96SmNDWXJOZzExU2Iw?=
 =?utf-8?B?RmpEc3huMXk3d040VnA4by9uK3k3S3NybUpPSE9oYmk1blBMSys1R0xzVTVo?=
 =?utf-8?B?UnFBbHpQMzhmOWFmL1RsOU11NllrSFFZbmhzR0prd2FrNzFVcU5jRk5FTElO?=
 =?utf-8?B?UkVFZUVCODAwUzd0R1BpWDJtQVNBNFkxY3MwcGlEOUtwb0QyRHJnNGl5NFVZ?=
 =?utf-8?B?a1g5azBvZDI1Y1U5WnVNZWt5VDM2Y0czOWZjYytXVXFNTzhEL1BRUm1uRERn?=
 =?utf-8?B?YXFXaGdWTEVNeXU3VlduNk45S1AxOGN4RENNSDVTU3FMakN6Ny8vazlMK2tu?=
 =?utf-8?B?ZW9ibGtibk5CTTJKOGNENnhJNzFid3IzWFY5QXd5NExDK0l1UjZHUEhoUFNZ?=
 =?utf-8?B?dWh0cFc0YjJlUFczR2RFU2FKWFJWNllJbzNjMmI0Yk9sWnVNNU5DVnFqa0ZM?=
 =?utf-8?B?TE53eEhVRkl0Tmw3VWc3RFlaSUtoNzA5VkdXclhIN0pCQ01XeE53OFR1S0E1?=
 =?utf-8?B?UGVjWTYzUWhXTCtZUkFCU0FtY3lCRTJlUG1SMVhFYUw2RUNvd3dtSHZIR1J4?=
 =?utf-8?B?SE0rUkRJWGt3dHlMOHRpc0o0RE1qQWw5bDhnVUs4K25IaWVEOGMxYTBVZjJQ?=
 =?utf-8?B?Z1dsSlZiT1p4LzFUdEFoK05WQldGeTRwS3F2dXUyc0hSMUVzdjk5SElvVFFw?=
 =?utf-8?B?TytSOTkwL0FZU29meUNsMnZZKzZPM04wc0JVK2ZBUC9CUUkrdElQcUNHWVlr?=
 =?utf-8?B?VGx5eXNNR3BxbDA3NUtxMHhrOUF0MTZVdC9zNGkvZkg1cEYvUXVtL292bXFo?=
 =?utf-8?B?WmdCdzRIaWxsaVZNTXA2UERIaHZCZkZRYmZ1Uit0NnZnN1psS2VjVGZ0cjRn?=
 =?utf-8?Q?TjbY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:45:16.6773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f00965-0dc8-4de7-d1bf-08de239d30bf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8946
X-Authority-Analysis: v=2.4 cv=KoBAGGWN c=1 sm=1 tr=0 ts=69175c9f cx=c_pps
 a=KhE4gu946QIFSMZrge1Egw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=spcqjml88TDtDxUO_NwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNCBTYWx0ZWRfX1Pu5gNazFRRn
 8x0kanCVyrPFjeoPqsk7pAn9EuGxp+11aVXr3TqXB4Bcy1WG+WgHbibn0KHqqftenrQWva1RkT1
 0qnhkFxKcClor05ALH43DsrdG4LpA+AZCymRcpa5hge5Hl5kvt5LHuGUA7Tn9h+ln6s1I0hOxgj
 pDUydG0Qjp2k4RNMEC0jHXo4sgTarKSq8G5pprwrtqj4ADXjEF+led9TU3Cklc7+rC23floBLPu
 UKLooDdg9P6Qw8dElgIiYpFwCwF7HoNcmdLHBof5dO1MiWT1aMpGjwdBSNu2JPZSjH2jT6RucVd
 t/I4ZXhiHqZ+KMn6Z3wLaAXXRo28h/DYHeFORTyZ1Nvv43r6XRVMuj5Egy9K7gNcCmaUzQcLvnd
 0hiZoH3njejjsd5JYoqsWOenPYdq1Q==
X-Proofpoint-ORIG-GUID: PxtmwI41neFvRbESRRnuEgndQX_mOQOK
X-Proofpoint-GUID: PxtmwI41neFvRbESRRnuEgndQX_mOQOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140134
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/5] ARM: dts: Fix "arm,
 smc-id" value for stm32mp23-u-boot.dtsi
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

CgpPbiAxMS8xMy8yNSAxODo0MCwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBP
biAxMC8xNy8yNSAxNDoxOCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBPUC1URUUgImFybSxz
bWMtaWQiIGlzIGVxdWFsIHRvIDB4YmMwMDAwMDAgYnV0IGtlcm5lbCBEVCBoYXMgYmVlbgo+PiB1
cHN0cmVhbSB3aXRoIGFuIGluY29ycmVjdCB2YWx1ZS4KPj4gRml4IGl0IHRlbXBvcmFyaWx5IHVu
dGlsIGtlcm5lbCBEVCBpcyBmaXhlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90
YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2Fy
bS9kdHMvc3RtMzJtcDIzLXUtYm9vdC5kdHNpIHwgNSArKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvc3RtMzJt
cDIzLXUtYm9vdC5kdHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAyMy11LWJvb3QuZHRzaQo+PiBp
bmRleCA4NzJhODczOWM1NC4uNWE5NDM2ZGQxOTMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2R0
cy9zdG0zMm1wMjMtdS1ib290LmR0c2kKPj4gKysrIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAyMy11
LWJvb3QuZHRzaQo+PiBAQCAtMzcsNiArMzcsMTEgQEAKPj4gwqDCoMKgwqDCoCBzb2NAMCB7Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBib290cGgtYWxsOwo+PiDCoMKgwqDCoMKgIH07Cj4+ICsKPj4g
K8KgwqDCoCAvKiB0ZW1wb3JhcnkgdW50aWwga2VybmVsIERUIHVwZGF0ZSAqLwo+PiArwqDCoMKg
IHdhdGNoZG9nIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGFybSxzbWMtaWQgPSA8MHhiYzAwMDAwMD47
Cj4+ICvCoMKgwqAgfTsKPj4gwqAgfTsKPj4gwqAgwqAgJmJzZWMgewo+IAo+IAo+IFJldmlld2Vk
LWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+
IFRoYW5rcwo+IFBhdHJpY2sKPiAKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpU
aGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
