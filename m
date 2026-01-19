Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 131EDD3A9FE
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 14:11:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBA73C36B3C;
	Mon, 19 Jan 2026 13:11:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D015EC36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 13:11:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JCuxsJ236271; Mon, 19 Jan 2026 14:11:42 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4br2n1dsp8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Jan 2026 14:11:41 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLMLPTbGBCbCEyDT736mQWM7ZKA3NXRbuZSHw5PIRPzBiuRhifYTXXsppKqPNA9UXoNR2yfkKfuKsToJlgftEsms2wkLJLw5tYLBBKEc5wOQOH2G3ShKfxAI/0Hlz2zOiUerJgE+Phb58dFSIngJz7HWiN+D6OlqvVuOp1ls2j+6Xi15yIEF9Pj/I10zvc6G57ypVSUKzI0qX1rKppvtWo2J/eiPpQmO2yg+OOsVYeuL/XCrCqDXAHDOAqfyoFAVVwkPw8TiG60Kl4APcYfGIAstwJcPj0zNw8JeD/uNANq1hqwvOkHOdvwgKtGzBWBFHuocnMWQmIMBkxq/Idc4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gM1etk8oeOk1ucYnnn5728MHAkvCD9KJir+YEQyYLlA=;
 b=xUd4Y9PdHROWcXF3LCqh9cT2U0cLVBfT+8ApWlBMQbcytSl4mq9BvQJgq4iRP6EowFTdXYNpiVgUS5yMHPeD1eb5xicYxoHpl43R9xr4BawkpIqQv/HPAvYnG9U7K8rs0AW4dCjS3geVj8E/gQLtp3FgBalN/uz+NRrGsAbvtvYtYreBm5gV6BzyWqQhcY2SLIhERb1/TqGnj6IM9IuG92iqS2vMsVEmI3+IvtFDbDu29LgfNqMnq8zq+wR0AonfVD7OEPkF/4gdoFvsL+zTot5Mi1dR4RXxOPDLvHvnfU3MuuEMVRtGwHCYXlcPly35DNsgJ8bl6W2UV8/BDMJk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gM1etk8oeOk1ucYnnn5728MHAkvCD9KJir+YEQyYLlA=;
 b=Z0t5WbiKSI13yNxcFFgINCkiqFNMI3lRDw04NKfVDnkrLL67D/ggo4uUsYwxPc3aYbnrfoNt6zoUDqWOdtxyqHtuswQonkx0cqDO3XeGwXgJUdzmrdS4GYPJ2jfyuq0DsllLUkGPpzi4u63bjyqOpQRrtoLlXKcV6bdEhG0/gW7iz1bw9QhOSNh4on9mKvy4bgYv+8Ut21FrlyWaTsZCgBw2SV1i/nhZGEuxanJ555kwo3kCst0+S963/YTo93+r2s9q3dP9CfW9SVqUgH91oRpyL/NRU0k+TCslMx7euImsYKTwhzeY2XQhLnZiTKmTyyG6qBP4ratEosCxE3oOeQ==
Received: from CWLP123CA0019.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::31)
 by AS2PR10MB7045.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:597::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 13:11:40 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:401:56:cafe::27) by CWLP123CA0019.outlook.office365.com
 (2603:10a6:401:56::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 13:11:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 13:11:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 14:12:58 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 14:11:38 +0100
Message-ID: <e05a7a98-bf3b-447f-a7bf-25ca2694a7e0@foss.st.com>
Date: Mon, 19 Jan 2026 14:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20251216-next-v1-0-469e1d901920@foss.st.com>
 <20251216-next-v1-3-469e1d901920@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20251216-next-v1-3-469e1d901920@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B0:EE_|AS2PR10MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: 750489d9-b5b1-4159-39b3-08de575c4874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXVVYWlrV3IrTEJGMUFsOG1FaWR6YnZ3OENscCtuK0tnZUJtVUtocTBET1Fn?=
 =?utf-8?B?RUtNZnZZUmsxa29ZYnhsM3RaRDZPeERXSWU5WG05Y29SV0dEekd0ZG12R0Jw?=
 =?utf-8?B?WE1KTm5sWFBZUDJ5QnFiVEhyVG5MMGlMYkRETWdoWGozcVNORWs5T1grOTNh?=
 =?utf-8?B?dmZuSG9iV1BDd2Z1cjUrTDdWNFlIcnBxcS84U2FpaVhJWEsrMnJ6TDN5Ris0?=
 =?utf-8?B?dkJIakpyUjBISmJiQ3ZobGNxVWRhdHhQSm5EUm1IWnZTOHp5N1h1NS9TV3E0?=
 =?utf-8?B?ODVNcjhncHBGTjBpb1JIMy9Vb0hUMXY1a296TkZLVzNVRzl2ZGpUSWszcWJZ?=
 =?utf-8?B?UkllU2JtTjhFSCtDSjdMaFRDUkJCU3I2SlExMWxFSXMzSVJXRy9wS0tkUjFF?=
 =?utf-8?B?aHplUm1DcHlNbXNCT0kwUHBpZS9JU0tuMjZVbEhERHRFODJyd2g0ckQ2UmZx?=
 =?utf-8?B?L05PVmk2dyszSnc3cXhNMmlMOEdYKzU4MlE1dnU5R2grTC9MVmVDTHp3Ym42?=
 =?utf-8?B?a0hTNm9YMWY0dWM0RjMzU3Q0TmJKQzRPamYvNkowdXBXRWtwLyttUTI2QnF2?=
 =?utf-8?B?Yi8vRUQ0aWE5UW1TcExzNWpZaC82NWN3U1hhTjljN3BabE9MU1Z3R3BveFh5?=
 =?utf-8?B?UHo2NHhteXg1dDJ1VmpOdThsVW1aZmhGRGRJbXhTT2NyQzllRm1Mc2xScUoy?=
 =?utf-8?B?Q245NFl4dWR0MGZZZWQyM2xKK0FTZm44OExVRzhRWXE1eXRKR1c3dCtSOExa?=
 =?utf-8?B?WmlOMGFIZjQxRmp6Y2J0bzcvL0thV1RENXg5YUM2b0lKZEtUdGpZV1JZSGQr?=
 =?utf-8?B?NjdHcThWYTQzVi92TmpSaHNOZFhIOEZ4VTFFMkNqQ29UQUNCc0JlcFZZREto?=
 =?utf-8?B?SkdQdWR3QTRpVHlScWNRVnc4YU0vcDVXK3Q0VjNENVFINCs4U3NQQ3h3Ykll?=
 =?utf-8?B?dFlrb3I3VHBlQjFGekNmeG5lRkNMakpJelJKVnpoSlF0Nk5ZVWNXeDJGZ0pT?=
 =?utf-8?B?aHNaR3lmdzUrQkRtalFZMkx4YTQybDkvTWRyNm1NN29nbTZVZXFlS2JydEdW?=
 =?utf-8?B?YVB3RlB6dldlcGErM0dQbUx0TFgyKzg2V0QvYUVkNHhPRmM5K2piNGNUdFlC?=
 =?utf-8?B?clJMMFRuNzE5aENkZmtvUU0yRG1RTXV4dXJidHN3MERFbHFTcWp2UThCTjhs?=
 =?utf-8?B?Sitra3VkMStsakk0M1pGeThSb2VuNHM2OFJZc0cySEF6aFJaOGpidVZlUDhQ?=
 =?utf-8?B?QjZ3dlF3eGNIVWxYcTNGNk1YYXFKWi85emtPWXdrNElZSmwyUFFaaGtRbHdj?=
 =?utf-8?B?Q3hMN0FHMU1kdU41TU15aHQ0elpaVFpKNmdUY2V0VXR4cFBiNjRwUXNvc2hP?=
 =?utf-8?B?MTBVMHg4OVU4bnUvNEpvaHhOM3o5YnBwbUk4UXBCWmhHQkpUWXc1eG4rd3JX?=
 =?utf-8?B?MlFXT29SSGpzeWNOVXpOQ09zZm1KdURJSlZZWmVxeExZWC9TSjV6aFNMdGFv?=
 =?utf-8?B?c1ZWTmFObWd3SEJpM29Pd2FGUVdycUdkNnYyWkhuZHlVREJDZFYxSXplT1Yy?=
 =?utf-8?B?V2NnRmJWdGkzR0VVa2Q0V1R3Y2NYWGVxWXBpVmxvbWhVOHBkTlVHdVVmbGZm?=
 =?utf-8?B?cG1SYzdTSTVvUk1pcEtIV01DbGVWTEZscE1XbEIwdUR3QUtKZjBNZnNXMUhp?=
 =?utf-8?B?NlpqVDB0TlJmdy9MdzRidGdiODBiRTV0bWdhdE9JZ3dLN2xWWEtHdnVCbDUw?=
 =?utf-8?B?eUc0azZybWxZZlVaSE9pV0p2UUloci9DdEdxUG9NL2crUnhlaVdnL0w5QU9U?=
 =?utf-8?B?VFFhcThhZ1JRUSsrY0lRM2I0a2dQRkwzY05VOE1Wa2RSVEtSL3dzQStqdkM0?=
 =?utf-8?B?eUUwQjVyQkNBVjVTYnNHbGdQY1hlTUhNc1owcEZjNnIxY2VCQVBOZFRVWUk3?=
 =?utf-8?B?NGF3L2FXbmVuemwwMi9wMnUvOVBXbGZDUWg1Y3dsVHhLUk1na1VNMXlWbjV2?=
 =?utf-8?B?SGZxSnhIMU9QZHBscWQ0UGhaQVB2ZEVvaEJ5dnpMYzQxYU9HUFR3aEJ0SmRh?=
 =?utf-8?B?cXRrMGZxbWJyUCsrMytib2JSSldISmtpaGEyU2tUWEUra0NEVUNvSHdoMWhW?=
 =?utf-8?B?ei8wYUI1c1pzemhRaWtBcThzbThZdURNaWx3VC9YOGR4VS9EekduemZkU3Z5?=
 =?utf-8?B?RmtKNk5sS1gxa1BLanVmZGtCVlJLMXU1YjhJV2Q1MlVqbFZWZEk5U2ppdHZM?=
 =?utf-8?B?eHI3WkdaYmFBVlk3cGZMNTRGT0xBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 13:11:39.6570 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 750489d9-b5b1-4159-39b3-08de575c4874
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7045
X-Authority-Analysis: v=2.4 cv=KfLfcAYD c=1 sm=1 tr=0 ts=696e2d8d cx=c_pps
 a=RyyIEAsz3HJQHbvHKsAcJw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vW1nh7Jg1_YA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=96wqQrmO1di0FMMJWQ8A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwOSBTYWx0ZWRfXzF6Hlolap9V1
 UfzZ27VNaehUUwhPuj9+d0brcB1tXQrHGXBpAuEDSwuukMqvsCkmteT7G21cDXyRlhrV+2ChCMv
 jfK8GBdaF2jgOtqa3G6ff7h78Kr5WjfU3JphZxkdkfG3FBhssKudiN7vb+RM5ieoCf5i74Hyz/r
 eC4HUvKov0x4pEde14tbViJiKXHaFMqeBToqmVtXPiPrG1XKeIMaDBLFIsrakj6fXQ4NtNXM51n
 9lmA0fkZYOrsxzJZpzlppXX8uSwLVCSPGOMw2TE384Fvftr2fAoXJ4mNAUOPAEa8tsoL143i/b9
 I4dwErNoNuvVCwT50RDET+xj0S/6WZ6Gca+NqO8EV2UD/hEiN4c+M2Vkb3A/d7Vob2nUVUYqhDj
 C8IlgmxTa+qRhtGc9pVxVj+4vRBXrt26/GigHtaEijGJybrkQ8BdDnWv7xzztFapG72Rgs1MITo
 oI3xge6CXegABf7ISLg==
X-Proofpoint-GUID: 3ZGHYAJIGDTmlhnNPtH7JZvkyNhzXdqb
X-Proofpoint-ORIG-GUID: 3ZGHYAJIGDTmlhnNPtH7JZvkyNhzXdqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190109
Cc: Tom Rini <trini@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] spi: stm32-qspi: Optimize FIFO
 accesses using u16 or u32
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

Hi,

On 12/16/25 16:31, Patrice Chotard wrote:
> FIFO accesses uses u8 only for read/write.
> In order to optimize throughput, add u16 or u32 read/write
> accesses when possible.
> Set FIFO threshold level value accordingly.
>
> Test performed by writing and reading 64MB on sNOR on
> stm32mp157c-ev1 board:
>
>            before      after    ratio
> Write :  428 KB/s   719 KB/s    +68%
> Read  :  520 KB/s  3200 KB/s   +615%
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   drivers/spi/stm32_qspi.c | 59 ++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 50 insertions(+), 9 deletions(-)
>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com> Thanks Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
