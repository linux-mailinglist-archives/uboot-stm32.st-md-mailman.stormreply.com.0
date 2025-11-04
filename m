Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F06FFC30151
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 09:56:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D7CEC62ECF;
	Tue,  4 Nov 2025 08:56:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 656C0C62ECD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 08:56:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A48lU4p1591789; Tue, 4 Nov 2025 09:55:51 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a7c80gxms-2
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 04 Nov 2025 09:55:51 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duaybghTXPXL8I+3gGcFOKBSVbXfQtLgSjBwx2vzlFb6ewe2TWQBqLrDUkFOzKWGvEFSmUQC/ONbbl/YBM/xpnO3YQjUL8yFTIl8RnoZH8nZfiFi/7x89Mr85DauUiqJXh/OHnV3NdIS+gAFDWgai9YGFZwu8an+7hvHdy0dkZHjnoyA2PlFolNKAEfwP7bQOKH695Nbu2oo5fqZmaXDYq5qXxzom+Htrr7kzMamNAX50Rok+2VMUoC9Z7OJ9gQwYIqn6QWlkgObg5lDrZH3yWTkYRQqIeDH7zPY30Bpg+q8CBu9aAQyM9e2s0q7bhoDsFj4XL8o9b89iujdSwCxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oFC8Pud3SEnyV3dM3MkepltL4bKU2LQ3hSqoYK0zJk=;
 b=RIWnXkHbqeGKlO+Y+u8L/ahg6cFk48OmLbo/5NKNxnZ4bRB0ah5NjZfbv/Ccj1P3ud6t6HEHDJ1ZNipSAOTLm2UIV7fLWELPIjv/TI7dY2KmGP8Bo/m64lGPiI4TTVYzbLqH9EWLwGuFLzbIhdPky72R5Fr5L70+q05EqEN2kr/EuHIEqWyApB3a67EEyrPNTizeTGHC+RrLjwG5OlcDtmx7ZMeg+WC99O56Gf0oUVRpE3SELL3IwkifqwtapvlZvQZgtqRUCdQ6Cu9Di3s/bZfGt2chmR9sPvSHiVHVeIa9Gde3jY0myKvhgPDhZ5RB/a+aRlisvKjARJg1IQBkmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oFC8Pud3SEnyV3dM3MkepltL4bKU2LQ3hSqoYK0zJk=;
 b=MOWYSvWdBrPu6Pz6GRavehfmrzt+LFMNa2phTiROeYSrqpjgswH4Km+Suu64u/uomaiuDL3QzTsn1PzUsKXI+qq55PEemxaC8Yhge+F3HmizSn/cve248NfdScFDECQu/aV8UmQp/E9YQnPHUCTiceiSiF+Cm+t0dwWtM3Aa1gaREXMB/iXZqmV/c60Q1B8QxWdkQ3Da6XIlsMhVf9LaZh9NzLXEkUMd9Q6gZU5u2fnDxpzWa6+cjMnFFZxtzrQhSy+se8kIgLM3zlMBk7bIdapbWLYtkz5bQqr1Zdc7IP5bCTmEe2Zn6wu1q90Fvdd5q+xkbQXEHR7Bhzvf78o0pQ==
Received: from DU7PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::20) by PR3PR10MB3820.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:49::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:55:49 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::ee) by DU7PR01CA0038.outlook.office365.com
 (2603:10a6:10:50e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 08:55:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:55:48 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 4 Nov
 2025 09:53:29 +0100
Received: from [10.48.87.93] (10.48.87.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 4 Nov
 2025 09:55:47 +0100
Message-ID: <2a3aa43a-ce19-41e1-ab56-556629ce5cf9@foss.st.com>
Date: Tue, 4 Nov 2025 09:55:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20251009135417.282290-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251009135417.282290-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B88:EE_|PR3PR10MB3820:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e49f31a-edda-4a3e-0d78-08de1b7ff302
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmVVbk9qWXVXaXl5bEJkY3RhQ0had0N4ZjdwYU9rY1BBV3U1dU5MZ3B0cmZR?=
 =?utf-8?B?alozcG1GWUtRcjFFbUlTSGVaNUpFL0VTZFU2Ui90dngwNU1hc0V0b2p3a2dS?=
 =?utf-8?B?cEpEWXJnOTJuNHFpc0piNTVUN1NOZlFKVnR1WjErUFYveG1zdlArSWZPSVp4?=
 =?utf-8?B?UkMwTUpOa2l1KzJMWUhveGNhNkhZNEtLMkNEZkZiUGdyLzZxVCtOekJLeGpI?=
 =?utf-8?B?YVozK21meWtqbFE5NG1DVE9OT3JVZ09PU0NZSURrREN4enM3N2xzQVUzZGto?=
 =?utf-8?B?c2N4c09HNXpaTFhCY2IxZmpDc3lHeWtsd0QzTmZxUkFkTjRZVUc5ZmdzaDRZ?=
 =?utf-8?B?ekpiUEsrb3JQT3pZMWZ5SnBOek9oSERaekp6dVFHeTRlQ0tFQ1luS29FNU9F?=
 =?utf-8?B?TzNGRi85OTdXSWpKVE1hTFdVU2JvWUFUQjB6dmhpRUNQeDNPb2lCd1FEM1cy?=
 =?utf-8?B?enB1Qjhqdm5xSmZuUnJELzBlQUl4UC9zcDBWVnJKellsSW5xU3VqVmlMYy9s?=
 =?utf-8?B?VmdIZnl6M2FjWXFwZ3ZDd2VHTDVZSHBqQ1JDUlZybGtlczluWDlOZGNpTEx1?=
 =?utf-8?B?SEc3SzNzVmpIS1dTRndTSEtVVlFUbTlIRVhCUitUa2VMeDhMdnhpbmRxTU9o?=
 =?utf-8?B?cTRHMkJUdkJsQXp5OGFnVWZDclhrOTBOT2ZjTkRYZXNUYllVR1o5TFYycXMw?=
 =?utf-8?B?VTBzZEsyaEZwQytxeXFtQkEwQWZ2NEh1WkNKcXdXNDVaczNMZE9zalkwVXJG?=
 =?utf-8?B?RFZucjd0SER3T3Z3ZXRCaG1BZVhtSUw3cVo1UVdkSjE1MUNtUW1NU1dnTFFn?=
 =?utf-8?B?TUROTHZ4L2UzeXdVZEkrbjFlVTNPdnFodzhuZS9XRXI3K21QejhBYldPc0FK?=
 =?utf-8?B?b3BicDdWdVhhQmxXYm9vbTVIRHlkQVNBUExoSU1CWTk1TVRWQmxSRHV4RDBr?=
 =?utf-8?B?QjB0S1pzV0Y2ZCtxbGsxcmFtV0lFakxIU0psQUE4TXBWK2pqUTdVaEk0M1pp?=
 =?utf-8?B?MW5UNXdBSkZKUXNyZW9GeGpCcmpORWtWbWxEMWtNV0JSQzQ0RkpYU0g3bHNJ?=
 =?utf-8?B?WE0zZDZBOVg5eXRHemhkbFdUTUdzMHlISXBOVzJXRHgvejZFSmNNWG9acUF5?=
 =?utf-8?B?c0E2RGlHN0pnc3hsMjlGSzkvdGRScTZxdkVidmV1aC9yTGRpNTZjb2FLYXV5?=
 =?utf-8?B?dnNPZEsrNkZsYXBZeDVtNCt1cStweDJWRG56KzdEcFlXTDlxTWJpcCtLUCsy?=
 =?utf-8?B?aVlvOXBaZnNlS2ljOTdvYlB2elpuRXFnbGdqRVdiVDd2SmtsdlZtUWtWV0ZV?=
 =?utf-8?B?WEdCS1Foa3Y1VG4rcGF2SXVLeTlsM3ZLRm82Mm82VVZuREt6ZWVNQ0UrWi95?=
 =?utf-8?B?OWt3emk0NVViRG9EUTZLWWFscHZIQWJiSmFGTXh6WHdtNjM4SDRDalFJTHk3?=
 =?utf-8?B?QlpzdW1GWEZjU0FEZzRVaW1MS3pxVXpLY0dWa3VDNFJ5UGJFU1NwMElQd1lr?=
 =?utf-8?B?YVFFOHVFNFpncE11eGZZeWt3ZDlOZFE1UXNKeXBWNzJTMjRRU2F2cCtRT1kx?=
 =?utf-8?B?NFBoc1JuSHNYdnJ0S2pwREZGNGllMlNpOFVaaTB2RHNOS2ttMkVRb01pNEdK?=
 =?utf-8?B?VEZIYW5QUkkwdml1M1lYb1dSK1lISG15eTFXSGhHang4ZWxnNTB2RnV5TDg2?=
 =?utf-8?B?WVVUWWEzS1JJS0haYUlpSmpFdnl0ZkFWMXl0NWRxY3EwRSsxdkNFMStsWHN6?=
 =?utf-8?B?SUFXZ2E3OHA0OFpNY1ArYXdNbHNxREFCVUZmQS8xdVFTdDYxTzIzSmE5NFZs?=
 =?utf-8?B?V0QwQXNmS2cxK083U05zOVJpV1hKSkxITzNZSnNxbFhkdTIxbVhobEt1MXZU?=
 =?utf-8?B?ZEN1dkNwR2d4ZnN2U1JZV2kxWEdoTHpZdkdDRFRlZ3lyaVhETzhGWDRxUngv?=
 =?utf-8?B?aHZ4R1JjeGU0ZWhONzVlYnhZSERmcHQydmVQSHhLSTRKcmYzOUltZFBEN25V?=
 =?utf-8?B?WVNWL0RudjVQYWpaNzh0OUdQVG8rM1FidWFUMlQydkZnWk1DSW54a0llZEFX?=
 =?utf-8?B?YlhnZ3I3bEE1UWtNcHcyN09Qa1FRcFN2S3ZiVFlNSjJ1dFd3ekhyMCtYVzdU?=
 =?utf-8?Q?RuOc=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:55:48.3943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e49f31a-edda-4a3e-0d78-08de1b7ff302
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3820
X-Authority-Analysis: v=2.4 cv=b5i/I9Gx c=1 sm=1 tr=0 ts=6909bf97 cx=c_pps
 a=0FIfyxYfePq3aMp09QyktA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=voM4FWlXAAAA:8 a=hnaajLL-A62Ox9eL94sA:9
 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA3MyBTYWx0ZWRfXyFpWyabHZxpt
 8FLHQMgKfxxtLgsXlCpuXaqokKoXsdOdOi+BYBBK0ncpfzZ/nTOsaptgho753PHS2rbqgyxl3CJ
 n2cv4oxiAamW5PO9K2c0JRFwnRiy19IELyGwAfVUJgggNbuPv40+kLhCkAUjnU9QnD26NsZAH6l
 odZaktb6cQrSjVxmCKvphRVtL5nwHldrLYyAfMNtM04vljL+lF/ERbpYkA0h56bNpN7CLG6sNHZ
 SrkjflzElG2yvkrjhQb3cRIXWhI5uRgGkOW7+/5LpNaUA3saskBUNVGAmxSGI3/asdWrCddQfBE
 86p2uuSU4y40GQJUT6eCIWu/oQ3OP/6sQURBHmeu7wr4zGEvLBw3xCEGnrfj+bgFo/JFYsOm5DP
 bK2nlpEupedq6GR3WPon9bIFYYNTLw==
X-Proofpoint-GUID: sVsRpTnvESTCK-nkeDN66odF4Dd1gxfC
X-Proofpoint-ORIG-GUID: sVsRpTnvESTCK-nkeDN66odF4Dd1gxfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040073
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>, Tom Rini <trini@konsulko.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v1 00/11] stm32mp1: Update led management
 for stm32mp1 boards
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



On 10/9/25 15:53, Patrice Chotard wrote:
>   - Drop old LED code from STM32F429-discovery.
>   - Update LED management for stm32mp1 boards.
>   - Enable stm32mp13/15 LED_BOOT flag.
>   - Make usage of /options/u-boot/ to configure led in stm32mp1x-u-boot.dtsi.
> 
> Patrice Chotard (10):
>   board: st: Update LED management for stm32mp1
>   ARM: dts: Update config node for stm32mp135f-dk-u-boot
>   ARM: dts: Update config node for stm32mp157a-dk1-u-boot
>   ARM: dts: Update config node for stm32mp137a-dk1-scmi-u-boot
>   ARM: dts: Update config node for stm32mp157c-ed1-u-boot
>   ARM: dts: Update config node for stm32mp157c-ed1-scmi-u-boot
>   configs: stm32mp13: Enable LED_BOOT for stm32mp13_defconfig
>   configs: stm32mp15: Enable LED_BOOT for stm32mp15_defconfig
>   configs: stm32mp15: Enable LED_BOOT for stm32mp15_basic_defconfig
>   configs: stm32mp15: Enable LED_BOOT for stm32mp15_trusted_defconfig
> 
> Simon Glass (1):
>   board: st: Drop old LED code from stm32f429-discovery
> 
>  arch/arm/dts/stm32mp135f-dk-u-boot.dtsi       | 11 +++--
>  arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi | 10 +++--
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      | 10 +++--
>  arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi | 10 +++--
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      | 10 +++--
>  board/st/stm32f429-discovery/Makefile         |  1 -
>  board/st/stm32f429-discovery/led.c            | 39 ----------------
>  board/st/stm32mp1/stm32mp1.c                  | 45 ++-----------------
>  configs/stm32mp13_defconfig                   |  1 +
>  configs/stm32mp15_basic_defconfig             |  1 +
>  configs/stm32mp15_defconfig                   |  1 +
>  configs/stm32mp15_trusted_defconfig           |  1 +
>  12 files changed, 44 insertions(+), 96 deletions(-)
>  delete mode 100644 board/st/stm32f429-discovery/led.c
> 

This serie and https://patchwork.ozlabs.org/project/uboot/list/?series=478275 will be reworked
All DTS part will be removed and submitted on kernel side.

Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
