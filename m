Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E0FCA7A74
	for <lists+uboot-stm32@lfdr.de>; Fri, 05 Dec 2025 13:54:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABE2FC628D4;
	Fri,  5 Dec 2025 12:54:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2067EC01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 12:54:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5Ckd8o2417460; Fri, 5 Dec 2025 13:54:22 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4aubndm2xh-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 05 Dec 2025 13:54:22 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbCU7KEXWE9Ux4rkJY7tb+6cDnHrRs4uWzHwQybQPHr+5CQRn/39C+DuKUnCNt0RWT/VAFFc/K7IhK20gGQELaQHY/Pms/lE4Fbt7zENWqhnFlYl5+6dORnCM2CAok7+y6ZEZHivfuYBbWjuwGvWusn/y+1vmOPV0FjoDZTdRr24n4O/sIkIaQlhkOKsEVoU+w/GCCJsZ4ZGXAXs5rCVktyEqNjPYN+jb1RFXtCcrnbUNgqviNYx86lbke1JaM6n9m5IigRSP3HTsihyzFGIdHPeWRL7gUJo47syAtkZJESXgMf0oezZkLN1+NsTVgYagD5DR8CL9Rd2iimBt5sO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3Q2CWo4vNMPHuNYz0jv3ffF6SIqz7X5wJkN4SdBxZ8=;
 b=is2jP+2lVROe8aidnxnvfzzp6UpGjGw8g2uyP5DN8fRzpYzF43f9LXPFHS8Yb9NJplOOndUuo6puH48K+BPbOHTBaeIbLx+ymIzCeGNtASFIbNaEsByHXQrgCj4dSltcnDzOFoQPq3AeWhHDzXcy3s10X3SM+gL1V8d3xSlZTU4TjZeuWPRz5KHrB+az0ANzwTtN8SsV7Y7Dk1lOJDyqQoaM6ozRiD5xuJD2x0l2/x3ApyUScVAgrUEDIMTIaLTo2lHRmtmpCZjsfv4VgQTeC49oEuIiWWTyaxqs3crVt3ySsi1gg2OkhFxruJyRfK+qbstzdn9BAejSXGo94whrJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3Q2CWo4vNMPHuNYz0jv3ffF6SIqz7X5wJkN4SdBxZ8=;
 b=AsKsHCMkLaTfzGxmtHAmk2n13khA7enlxSNVihOY2xNkC3JigFOF0zmA7HEE/V6lIHev/V5ihXyi1qCahD1ByX2C0Nvy21ANzT7X2Tcx1ouNmru+0kVFSzoQDBu1HmjWLytcupd+nXxC0NvNOH9cUnUvgu7RBEJtyDIdUHzkKtQaKSauEugUDkatTEwR5mbo2DcyvdNafJ6RXPzb1jYh/RJR0xeEFAcr58JNH7EFnzzBTq+1lzzpuvC/CsiuZ3u62Jdhckynrzza6LaUuDZEkdJ8WXxQEThQO+jSvbwZTVkU5PgMQjMZIi9EJ2Vw34NG8hgrzY6PPbQyJt1M//WK6g==
Received: from DUZPR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::13) by DU4PR10MB8655.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:55c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 12:54:21 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::2f) by DUZPR01CA0086.outlook.office365.com
 (2603:10a6:10:46a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 12:54:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 12:54:21 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 13:55:01 +0100
Received: from [10.252.31.202] (10.252.31.202) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 13:54:20 +0100
Message-ID: <d27ae6af-51e8-4d1c-a24d-d5d2065ced66@foss.st.com>
Date: Fri, 5 Dec 2025 13:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251118231717.577932-1-marek.vasut@mailbox.org>
 <b97630e9-d93d-4c63-84f7-685027b54957@foss.st.com>
Content-Language: en-US
In-Reply-To: <b97630e9-d93d-4c63-84f7-685027b54957@foss.st.com>
X-Originating-IP: [10.252.31.202]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61D:EE_|DU4PR10MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 66365641-e7f5-43e8-997f-08de33fd6907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmN5a3VrMUNCQk1LbDNQUmRqREFFZWdpUHVhVDhVSVpFOTZTUTBtYzRUWUVP?=
 =?utf-8?B?dlhUck9aaXM0Tk84QkljSFJaSVMvOUowekd5eXdoNnJYcTRLc0Eyclp1WmEz?=
 =?utf-8?B?Q3Qxb0FndDhGLzJLeUpWVzhWMnZyRDhyWFhXTksvSWdKSDIrY1AxZ291TVE2?=
 =?utf-8?B?bnNtK3dWbFQvTlpaWGxNL1pkcmtSYm9uQ1hxeFlqVVZwTCt1empRRmJSZTVB?=
 =?utf-8?B?VUQzbThDSEltYU1vUmYvVU1qRDI5dmlEUEJReU1EQUJDQnBHalJIL3l5Q0sz?=
 =?utf-8?B?eVFWem5iVm5xbGJpN0ZEMGFOWHgwdmkzcTg5ekpTMlpOU3dQQ3kxSUUzS3E1?=
 =?utf-8?B?bDNWYnZLdDJNR2xHWTI4SVZWQ3FObVl3ZHdJM1BGTU5oWnc0OUZxaGwzZENm?=
 =?utf-8?B?cWxRdExQUitTeTRmd1d2OVYyY2p0Z1BSNytqa1l2cTNuOWN5WGUxdmhybVVr?=
 =?utf-8?B?M3dJaW9SQ1B2dDBEdjRBNzZtSFhrSmcwNmZQWWFralU0WGYvRmZoNVlHNGt4?=
 =?utf-8?B?VUtud29PLzhqcGFGOVo1c2M1MmtPdlkrQVhwSit6eVNNdnloK0tJRWt5QnJH?=
 =?utf-8?B?UW04aVJNK2phbGdUSFhMOEthcVJCNkoxVDk5Vm41dHN3c1JyVVVucmVHaGpz?=
 =?utf-8?B?RVR5M0VVQ2xXeENDT1M0MjcwQ1lETmpBMzZaNG5GUUhQVnZZZkI2RDFkZWlO?=
 =?utf-8?B?NkdRYlJQWE9JYnUzYWYveTgrU1l0RXVjNElmMUc1UkxYOXZqVGpLaUtuTGl6?=
 =?utf-8?B?Nmg0VmM0eDZLU3lIdmt6ZVc0UVk3S3lPeXFtOS84eEdUY0kweXoxYWw5S3ZZ?=
 =?utf-8?B?TGEyRzliYkdaaUc4T2QraWYwT2c2VFdxWjE1YVNmZXI4WmVKUXBkam5ieFRt?=
 =?utf-8?B?cWs3TGtkT3pMZXYrdXBCV0tMazg2WFdwNWJIa2djUUFObHpKRFFhYUhlbDdq?=
 =?utf-8?B?OE15bVVnOTZzZ1RsdXgwb2FJM3FsSE5QRSt5LzdhRVMwcVNtYnBXMTZLMlNG?=
 =?utf-8?B?cmRpQlo0SnA5OFJQN3NIVjhvaFdEbkNld2svNGtEdmZ1NVVlVHFtVzJCNFpx?=
 =?utf-8?B?M0krZkMyL2YrYi9vRkk4d2JtQ0JmWUFReTBaa2ZDNTZ3cHMvNm95TkZRb2li?=
 =?utf-8?B?VVNLM0g4Z3BNUXhpcEJDYld5YnRiRVBscXpYN3d6NXF1bG9SQ1dIcjVxVkJa?=
 =?utf-8?B?ODBXdEphSEFrcVJ3Wk1SK1Z3bW0vS2lFNUI4MTVFZVRNYkV3clQ2ZkpNVEsv?=
 =?utf-8?B?U0FMUzhTUTN2dFFOUmQ2cndUU1hPdmxhb3p0MEE5ZFRQbGtORG0zMWVDVExo?=
 =?utf-8?B?UktQcTNvS0hmZHNuWjFPT2dHUFFMcjFSa2licGpkYTloVjdvVlMxM3JZNEsw?=
 =?utf-8?B?MmpZelJSaXA0dzdxaGR2ZzVNdVEycmxKcGpiR1FCa05qWkJCZlRJZUp3N0tZ?=
 =?utf-8?B?TkovcHVjbW42YUh3OVFRSjNpMWlvMld5dmI3MlRHYVVMekRIYzJuWFpvdndk?=
 =?utf-8?B?Tm1XWU5DaE5za0FXeUVUMld6amptcWFVVnFtaFltRVNXRkpoNWIxcFJNVHpR?=
 =?utf-8?B?cy9BazdpSWNvN3JzaG9YbEhYL240RFZaaFZlaUE4TFJmWkhjdFZaM29xblhF?=
 =?utf-8?B?eDRsbnJwWlFaRzhySzFvMHpBNElUYm9vTGp0a2NaWWN2aGE0cWdISGpSQUpT?=
 =?utf-8?B?Y1RMWEJaQkpDTEVzUGVTOXBxMXZGaHRoeWovUEhWWGw1dTZxY0R2ekwvRG1M?=
 =?utf-8?B?YjUzcHBaUWxhellzTWxMWW9sNU9FREsrbllVT0dOQXJMajlXcUM5ZUw5MGM4?=
 =?utf-8?B?M2dNMitiL0pVdlVYOTJIbW90cHB6Y1FWdEtOemNzZCt4MjVScERObU1Wb0Vr?=
 =?utf-8?B?VkpzWnVKOGxiVmQ5eHFtTTgyMTBQQkdUeGVkOURWUEVyWUVuV042QWcrTzR0?=
 =?utf-8?B?NDEvamY4U3hubDRJNm9nQ2hLZUtjQ1RDSEM1OEd6OG4wbnVYZ0ptbHRKQkF6?=
 =?utf-8?B?RXFJQTkzakliVkF5VEYyNUdFZjhNNkVtdm5NdlYrb1EwTEZ3OVpNZHB2azhI?=
 =?utf-8?B?ZlB2MTZjN1l5czA3VUtiOVd5YnRrVzdlRnFvOEFKNXFQRENBYjBJQ3QrOGtu?=
 =?utf-8?Q?goCU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:54:21.3942 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66365641-e7f5-43e8-997f-08de33fd6907
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8655
X-Proofpoint-GUID: aBwUGD_QqqlYdYrNDuCvDteq8nqG3xE7
X-Proofpoint-ORIG-GUID: aBwUGD_QqqlYdYrNDuCvDteq8nqG3xE7
X-Authority-Analysis: v=2.4 cv=FtUIPmrq c=1 sm=1 tr=0 ts=6932d5fe cx=c_pps
 a=DM4fB4fa4Hi34HIlWU65MQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vMDSZMCM2png5bxp:21 a=Uo5EeBN78AAA:10
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=-j80Tvi3LGnwIJeMGuwA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5MiBTYWx0ZWRfX/DEtoHlolMf/
 ONL/hwphybECCH9PYJWUSX3q4qvBHCeFaBSx2th4EZMH1gS6e9xleTjmismAljjdeInZKiMXv6s
 alfoOxN8nEO1m6U7clFJogJZUtWA6PDmb+Lo16D7if0HX8NVG0raaTcejoPayl1M4iVEFGEv82I
 KXOOxnP4ObMpze0T+K6N3PAqDgT8mhjU6zoQ0rgPiONzgrhiK6+hUEWy5TjTh4in+hdSjp1E11P
 pB/mObhP0WfmoVrsZz6tHOoVBPsGZNX2kxqM+nfkS96h0zOklEP5dWfCWILmi8i6HO6adElR57/
 iepxblNPGUDLeaAJfyIupOlHTPEPFkEHlSEVK8QAesUSvHLrzqHLxswa1/+njK5WZ28MXjUS8gf
 wZEM5yrzjp1+s/dck7K0x81M3XzpHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050092
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: Fix handling of OPTEE in the
	middle of DRAM
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



On 12/3/25 15:52, Patrice CHOTARD wrote:
> 
> 
> On 11/19/25 00:17, Marek Vasut wrote:
>> STM32MP13xx may have OPTEE-OS at 0xdd000000 even on systems with 1 GiB
>> of DRAM at 0xc0000000, which is not the end of DRAM anymore. This puts
>> the OPTEE-OS in the middle of DRAM. Currently, the code sets RAM top to
>> 0xdd000000 and prevents the DRAM range past OPTEE at 0xe0000000..0xffffffff
>> from being set as cacheable and from being usable. The code also sets the
>> area over OPTEE as invalid region in MMU tables, which is not correct.
>>
>> Adjust the code such, that it only ever sets RAM top just before OPTEE
>> in case the OPTEE is really at the end of DRAM, mainly to be backward
>> compatible. Furthermore, adjust the MMU table configuration such, that
>> the regions over the OPTEE are simply skipped and not reconfigured, and
>> the regions between end of OPTEE and RAM top are set as cacheable, if
>> any actually exist.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@lists.denx.de
>> Cc: u-boot@dh-electronics.com
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  arch/arm/mach-stm32mp/dram_init.c    |  4 +++-
>>  arch/arm/mach-stm32mp/stm32mp1/cpu.c | 11 ++++++-----
>>  2 files changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
>> index 34b958d7afd..e36e42e7c61 100644
>> --- a/arch/arm/mach-stm32mp/dram_init.c
>> +++ b/arch/arm/mach-stm32mp/dram_init.c
>> @@ -65,6 +65,7 @@ int dram_init(void)
>>  
>>  phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
>>  {
>> +	phys_addr_t top = gd->ram_top;
>>  	phys_size_t size;
>>  	phys_addr_t reg;
>>  	u32 optee_start, optee_size;
>> @@ -86,7 +87,8 @@ phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
>>  	/* Reserved memory for OP-TEE at END of DDR for STM32MP1 SoC */
>>  	if (IS_ENABLED(CONFIG_STM32MP13X) || IS_ENABLED(CONFIG_STM32MP15X)) {
>>  		if (!optee_get_reserved_memory(&optee_start, &optee_size))
>> -			reg = ALIGN(optee_start - size, MMU_SECTION_SIZE);
>> +			if (optee_start + optee_size == top)
>> +				reg = ALIGN(optee_start - size, MMU_SECTION_SIZE);
>>  	}
>>  
>>  	/* before relocation, mark the U-Boot memory as cacheable by default */
>> diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
>> index e0c6f8ba937..252aef1852e 100644
>> --- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
>> +++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
>> @@ -82,11 +82,12 @@ void dram_bank_mmu_setup(int bank)
>>  	     i++) {
>>  		addr = i << MMU_SECTION_SHIFT;
>>  		option = DCACHE_DEFAULT_OPTION;
>> -		if (use_lmb &&
>> -		    (lmb_is_reserved_flags(i << MMU_SECTION_SHIFT, LMB_NOMAP) ||
>> -		     (gd->ram_top && addr >= gd->ram_top))
>> -		   )
>> -			option = 0; /* INVALID ENTRY in TLB */
>> +		if (use_lmb) {
>> +			if (lmb_is_reserved_flags(i << MMU_SECTION_SHIFT, LMB_NOMAP))
>> +				continue;
>> +			if (gd->ram_top && addr >= gd->ram_top)
>> +				option = 0; /* INVALID ENTRY in TLB */
>> +		}
>>  		set_section_dcache(i, option);
>>  	}
>>  }
> 
> 
> Hi Marek
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Tested on stm32mp135f-dk and stm32mp157c-dk2 boards.
> 
> Thanks
> Patrice
Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
