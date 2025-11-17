Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3CC62AC3
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Nov 2025 08:10:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04AC9C628DE;
	Mon, 17 Nov 2025 07:10:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 166E3C030AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 07:10:46 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AH6oBZb615783; Mon, 17 Nov 2025 08:10:14 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011044.outbound.protection.outlook.com
 [40.107.130.44])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4aejghn9v8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 17 Nov 2025 08:10:13 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mP5d5GRMUXBLcHbU5sBGFTup2zXi1zsDTORzTAdxOHJKLV3qUhw9kglXZASM5lgD2hIsUPTsV9AKn5U3PhNR6yGLsvDXvpsnJcznB0PMbZXqcjpY+MX9V7SfVfQPpiHiE5cspxwfJrOL5VxdiNxS2TkDuFv2rr4qnPjwXH2Cz+2JHHUQGCJhOlKhKp3lAbwOqN0cFZDfYh3tw5y7ZWFYQ9J/2Qb29aFDS9FvwmoVmvcg6nBKeTVx1BhG3Px+v+/RkJlGlw0FtWczO8HumOUBfncVvrLvWXPBdBrIQmZu0rcavHkuCN78oULQXcaxtr4g84jNljqXqP+SZlICgDzBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cH17TE0GnKZMW1o6+SBLDImfcrAqfE3ZjP2K1Lwi/I=;
 b=nCRhqNE+h/RbJ0a3pP4Ran7EXYSTDZe0UUOmLYVb+kDK5tqtz4AJ0nW8VLZGsqXqvmZkYMC6TeYAaH5sVKxwAsOBHmMlPTyIAQiMC6ROUMFL3VOI8X9o57r16OXbnEhhdm7Bv1YrqA20G3PkUHRsTw0zThxPCk0kPuQ4/DP0BgiutHSJ3y7pwkmyJAEPRT8cbmsA04YZ7qJ6CmjA8qIjSwOHz7l4zxPcf+5whAHuaODQJEa4vy+zMS6YuCw+CChOZv/pqXNnydQs98zfnTugDQYLeLth0ndp0TKwDKeKchKRZyiCSmdDkXu11aCLq13t5OQcpkIgwXvpBg59ks/ZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cH17TE0GnKZMW1o6+SBLDImfcrAqfE3ZjP2K1Lwi/I=;
 b=KTJ9YF70XZ92dYlYkhYUjB7j4bBOnwuXxkcuDzS/8r/Q/quxhADZNIKlnmEJFe/xqC8VaYIIm/64k9oiTRtNVoECDhBCXKa+ZR1HuA6Qb76bAfhJmK7GuPaNs9Tcs/bVa8jBBCDoVWjpckFegYiEyQ4m81tMZMjD0QaF9GST6c6kSbivKxjpZCPiNRv2FtnfBnHvZEnj1Yq1aF5aoZNXC1aBRfsL1cPjgfG3kAm4jNKUEHbJm95kNEGmL8TTWfRsTPzbbcRlskHDNLT987yuNBQ/WA0BRTaKdCwXr0bEC/u1BGC02hN5CcG2dbD1cdbXkDk1K9sE17qsRRJhoIFscQ==
Received: from AM0PR10CA0040.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::20)
 by AS2PR10MB7763.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 07:10:04 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::69) by AM0PR10CA0040.outlook.office365.com
 (2603:10a6:20b:150::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 07:09:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 07:10:04 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 08:10:17 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 08:10:03 +0100
Message-ID: <98804eef-ad91-4543-9c81-00c1c87f13d0@foss.st.com>
Date: Mon, 17 Nov 2025 08:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251023214855.181410-1-marek.vasut@mailbox.org>
 <20251023214855.181410-2-marek.vasut@mailbox.org>
 <4050a7ca-7a3c-45c7-bcfc-ee62caf4a6d6@foss.st.com>
Content-Language: en-US
In-Reply-To: <4050a7ca-7a3c-45c7-bcfc-ee62caf4a6d6@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004C:EE_|AS2PR10MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 557736e3-27ca-4ade-815e-08de25a8553e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azFIT1p1bE1heUY4Ym9sUldPN1pHSG5USE5SbWJhcFErYXhCN2NvSStUQVdC?=
 =?utf-8?B?YjRIM0RhUittei9sTzdkSFdjRjRBUEFnb2c1eEowWUo2YXVicVVFTWFLcFhW?=
 =?utf-8?B?aElFWXRJNkpVd3djem9WRS85ZmFZM0xXRldFTkt1aDAxMFpIQkFneDV1aHp2?=
 =?utf-8?B?ZHBXb3cydVZrZzNtcnQ4QzB4TEhORG5YdEZ3andCS1Z0TzV4dXJlazV4akJx?=
 =?utf-8?B?TjR6ZFZSMmcvK2FZZTdXa0NwU0R1cGZkb3V1MzRiVklsbUVMQ091TVpkeWFl?=
 =?utf-8?B?UXRKaHZiODhNUHdMeTB6dnV1SDU5cDd4MDNUSW14YkRuNU9pTEVpaklYbldU?=
 =?utf-8?B?WngrZzdma0RjbUN5MHQxdHc2ZHNvNHVOL0xMRU02TGphWHAwQW5Pa0RxVi8x?=
 =?utf-8?B?TzI1WDBXQldJM1A2NmxMc3NLclJUQjJyQkVwOEh6SmVRcDBpZVhWOERab1NY?=
 =?utf-8?B?Wnc3R1J4U2ZwUFV2enZDV2RIeEhXSnU2a25pbEpiZHRDM1dCWEw5aUhNaTh5?=
 =?utf-8?B?OVNnY05IVHJWUjRyYmlzR29JWXZpWng4S3hkblVXS1BMM0dYbDhtSk9pbjBN?=
 =?utf-8?B?eHZmTjdtSjNWcGxPbTZxc0NkTHJaakdYU2p6M05qaVdEUEZhbVo0Qmt1VnZZ?=
 =?utf-8?B?WmFOdGZaSGw3TmwyeGJvbUxiU2hVUkhPRXNMWGtpNnpuSDBYeTQ2aEdSUmEv?=
 =?utf-8?B?WG9BM2hPZHR2blEwTEtHVkt5bFJsTklqbW5WYXZpTnUybWZ0ejJwb3FOQjhC?=
 =?utf-8?B?dVdxWTN4bFV1S2YxK2hKUEtyRkVpdXNtTm05ZDRORWswSjBpNFhCUmtYZWxD?=
 =?utf-8?B?di80M09pZG5kSVlyTUJjQWpsVkJWMW1taUZMOXZwdXdMUENCTUVqenNHTkJi?=
 =?utf-8?B?aTRvOXdqbk1nTFo1Sk15VVZibmRmbXBtMnlGZnZqdjhtUHJBWVRRSzNZMUVu?=
 =?utf-8?B?aE56UWhUaDBIRVJrL1FyVm84aWVTMjVXOFE0ZU4rTjdKKzJ1S2ZzQ0hiOWN1?=
 =?utf-8?B?M0hhS2IwekFNZENvU3pCRDF0WWovUGthOVJXVnpmcG8wVWwxWkR4Rkhxc2g3?=
 =?utf-8?B?NHZpVjhweFhvQlQ2aENPVHRHcE9uVUZIWG1zMWx6TWtEVlg2MUgrV2lLV3I4?=
 =?utf-8?B?QnFRZm00ZXREM0FJY1owbGxMTXNlN2lwOHg4RDV5bDhVVzdBbEVlU3QxTmlp?=
 =?utf-8?B?ckRxdk1xazFyeThGNlU4MWU5UExqN2dyZ0d2Y1lMbmViM2VOMlgvOWI5Rklh?=
 =?utf-8?B?S0hDbmd1VnRjTmppUERDNEJRVVloMXNSRzkvRW5Mc2N1aGxnOGpHdjJkZS9M?=
 =?utf-8?B?MW9oTGJ3elJ3RWZQSmY1VGRmcGdrSVNOT0lUeWkvdGpuQm4rWWlCZ2pWSkg3?=
 =?utf-8?B?NGhJVTh4cFR3YVRreGNUZ0o3S1g0TWNlR3FtYjZpa2t4a0xsRjd6OWJ4a1kx?=
 =?utf-8?B?ZEhzYTlOdEUxU3gwc09UMWFacnp3ZEhEaUV4b01sV3owdUFOUmttMUlFczh3?=
 =?utf-8?B?N1ZPaTh4SDBDb01wQjVCdUlPRGV3MjBYdmE0d2Y1aWwvaDQwcHhENng0aEZo?=
 =?utf-8?B?Rm1uNHZPNVJBZWJqRGEyU1ZTaVhZc3luVCtuQ3JCdXgrYmRUangwZGovSWUv?=
 =?utf-8?B?OFh0QVlQQklMclVZK3Q3c3NEblBxd2JtNXRCNE1XdHVWT01hOWtmMC96b0My?=
 =?utf-8?B?VUpuV01JVFhhYnBMenpRTS9uZjFuS0dRU3JvTjA3Q2tsZ1Fsa1VRN0s3OGwr?=
 =?utf-8?B?elQ0aldsaVAzUFJkNXBkRmVtSTdncldwK0lMVTRxNjZsSFMybjArdU8vWkl5?=
 =?utf-8?B?WE1xcnBhOGhid0xOUm1taVBsSVZtd3JzYlEwV1VTcUtETWZXcG4wdFV1UHRi?=
 =?utf-8?B?WmFtWkZUWUV5RG9QdVl1ek1UZFJ1Snh3TWNBajQrNjl3Y2pXc1MvbnJCT2Nz?=
 =?utf-8?B?U1hUeitjVkxhd1lMSWt3UnV5MndmOE05SHhVMWwxRVRjYjVscCtSbHBRcEpW?=
 =?utf-8?B?ektGZ2V5ZmNrSWVoaVRWZWlURU9nYjFJR3lRbW5aZXBydk03VzF4L1pydjdE?=
 =?utf-8?B?NDViYTJqOExicTVNd0lXNzBUeWdheVhHYlZXRFhZV0dkaHRiVnVIZFltbDg5?=
 =?utf-8?Q?XCTw=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 07:10:04.7255 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 557736e3-27ca-4ade-815e-08de25a8553e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7763
X-Authority-Analysis: v=2.4 cv=G+cR0tk5 c=1 sm=1 tr=0 ts=691aca56 cx=c_pps
 a=/50zGBynOqPJ0sMV+cRBzg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=lMqmPoWa79AlLkrwY_wA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22 a=HhbK4dLum7pmb74im6QT:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-GUID: sCV6vnlgEUdjJYq9m7A2cju31wEwllA5
X-Proofpoint-ORIG-GUID: sCV6vnlgEUdjJYq9m7A2cju31wEwllA5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1OSBTYWx0ZWRfXykPlomIb+ttQ
 1Ab8A66iF7Ac8DJbupu6f7kdpktDfSt6tBSwh2xuU5zua+q97Imdcok9yXmO49x2vwNpkfg/qfc
 d9C2moChTS4ZcdcjVXLBiw/lw/gaFBAnMJEb0MxJFu3gBFp9tCTW+uTA0vysu+Uwv5Vthq4DOgL
 LYS2E/H7IGHinRSuMB9+vH0Jcc63JmlbmSZh1mEiPznO2xlIu5W30cbD2qPQxTZ6DSiLSGTDpbN
 DY1Lb/r2CqQ9JlxZ/H8x9LvKC1qVxRzcCPdcvS710uf1tDzTH8soR+Tz5X0FpfgbT9ZP9aUUFe8
 V2NKwwBFURHdmkVGAYaDT7QMJDXZt6Jz0E09GCDqXkGM7JebKz2mU0+NhhLvJclJ/a+yqnihglJ
 ImFq6oEQb0Q8GQ/+roDr7tOvR6A7uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170059
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 2/3] ARM: stm32: Read values from M24256
 write-lockable page on STM32MP13xx DHCOR
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



On 10/27/25 18:18, Patrice CHOTARD wrote:
> 
> 
> On 10/23/25 23:48, Marek Vasut wrote:
>> The STM32MP13xx DHCOR SoM is populated with M24256 EEPROM that contains
>> an additional write-lockable page called ID page, which is populated with
>> a structure containing ethernet MAC addresses, DH item number and DH serial
>> number.
>>
>> Read out the MAC address from the WL page between higher priority SoC fuses
>> and lower priority plain EEPROM storage area. Read out the DH item and serial
>> numbers and set environment variables accordingly.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi |  1 +
>>  board/dhelectronics/dh_stm32mp1/board.c    | 51 ++++++++++++++++++----
>>  2 files changed, 43 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>> index 5ca0258e3ff..bedb7c600d5 100644
>> --- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>> @@ -10,6 +10,7 @@
>>  / {
>>  	aliases {
>>  		eeprom0 = &eeprom0;
>> +		eeprom0wl = &eeprom0wl;
>>  	};
>>  
>>  	config {
>> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
>> index a9b1a0f2c34..065d2f338c2 100644
>> --- a/board/dhelectronics/dh_stm32mp1/board.c
>> +++ b/board/dhelectronics/dh_stm32mp1/board.c
>> @@ -119,7 +119,7 @@ static bool dh_stm32_mac_is_in_ks8851(void)
>>  	return false;
>>  }
>>  
>> -static int dh_stm32_setup_ethaddr(void)
>> +static int dh_stm32_setup_ethaddr(struct eeprom_id_page *eip)
>>  {
>>  	unsigned char enetaddr[6];
>>  
>> @@ -129,13 +129,19 @@ static int dh_stm32_setup_ethaddr(void)
>>  	if (dh_get_mac_is_enabled("ethernet0"))
>>  		return 0;
>>  
>> +	if (!dh_get_value_from_eeprom_buffer(DH_MAC0, enetaddr, sizeof(enetaddr), eip))
>> +		goto out;
>> +
>>  	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0"))
>> -		return eth_env_set_enetaddr("ethaddr", enetaddr);
>> +		goto out;
>>  
>>  	return -ENXIO;
>> +
>> +out:
>> +	return eth_env_set_enetaddr("ethaddr", enetaddr);
>>  }
>>  
>> -static int dh_stm32_setup_eth1addr(void)
>> +static int dh_stm32_setup_eth1addr(struct eeprom_id_page *eip)
>>  {
>>  	unsigned char enetaddr[6];
>>  
>> @@ -148,20 +154,47 @@ static int dh_stm32_setup_eth1addr(void)
>>  	if (dh_stm32_mac_is_in_ks8851())
>>  		return 0;
>>  
>> -	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0")) {
>> -		enetaddr[5]++;
>> -		return eth_env_set_enetaddr("eth1addr", enetaddr);
>> -	}
>> +	if (!dh_get_value_from_eeprom_buffer(DH_MAC1, enetaddr, sizeof(enetaddr), eip))
>> +		goto out;
>> +
>> +	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0"))
>> +		goto increment_out;
>>  
>>  	return -ENXIO;
>> +
>> +increment_out:
>> +	enetaddr[5]++;
>> +
>> +out:
>> +	return eth_env_set_enetaddr("eth1addr", enetaddr);
>>  }
>>  
>>  int setup_mac_address(void)
>>  {
>> -	if (dh_stm32_setup_ethaddr())
>> +	u8 eeprom_buffer[DH_EEPROM_ID_PAGE_MAX_SIZE] = { 0 };
>> +	struct eeprom_id_page *eip = (struct eeprom_id_page *)eeprom_buffer;
>> +	int ret;
>> +
>> +	ret = dh_read_eeprom_id_page(eeprom_buffer, "eeprom0wl");
>> +	if (ret) {
>> +		/*
>> +		 * The EEPROM ID page is available on SoM rev. 200 and greater.
>> +		 * For SoM rev. 100 the return value will be -ENODEV. Suppress
>> +		 * the error message for that, because the absence cannot be
>> +		 * treated as an error.
>> +		 */
>> +		if (ret != -ENODEV)
>> +			printf("%s: Cannot read valid data from EEPROM ID page! ret = %d\n",
>> +			       __func__, ret);
>> +		eip = NULL;
>> +	} else {
>> +		dh_add_item_number_and_serial_to_env(eip);
>> +	}
>> +
>> +	if (dh_stm32_setup_ethaddr(eip))
>>  		log_err("%s: Unable to setup ethaddr!\n", __func__);
>>  
>> -	if (dh_stm32_setup_eth1addr())
>> +	if (dh_stm32_setup_eth1addr(eip))
>>  		log_err("%s: Unable to setup eth1addr!\n", __func__);
>>  
>>  	return 0;
> Hi 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
