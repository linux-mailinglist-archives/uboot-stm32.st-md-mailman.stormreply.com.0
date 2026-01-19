Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E68D3A9B8
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 14:00:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07161C36B3C;
	Mon, 19 Jan 2026 13:00:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F953C36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 13:00:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JCrBOH1377417; Mon, 19 Jan 2026 14:00:51 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013054.outbound.protection.outlook.com
 [52.101.83.54])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4br0qkwytm-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Jan 2026 14:00:51 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3AWHVXAr/IEc4WFxyHA/vDjh7sGS+mESw63J9Qc7C5U/kRV/xoQFxwB2ylUxseO8jGqi1LqNQ0V+5x03/hqJ0z9Fz4q6KWg/VYtdlu47PlXNwcDsM6jPu4tZpo3dlV0kwmz55pJsFhSHIyT6dOq46uzq2xvTuEoK56c/qyrAEqUOZF4jbftSAWQNlO0c1yAzf4Mok87Tm4iRLC7xAHVqrfjo+GNyjHBMTZMkluixG6iPeQ5NZ7qQRIu3DbeCvKoMGhVRPlNDrNveSgFSXkjyxSg6/hIhEKlVNdwmt833QflPAJPZs0iy8gSUwl7jju99IdHeTVMXvyPfQYdnNRrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDe7PPbQ+4BrnIK8F7zKrnQiM6faN9c6Qs0+vpt5zqo=;
 b=gvLFJK5JYZMYca7q1ObFaCR9lhAqRyteEdG0eHA7SPyI5I2YN4upMDDBYhQv2c816iU3+jBybI2m63896bI8ufwptpwrYVW7ja0plztRZEWw9NnmLRTGGDG1en6yQqeJz3/5jrqYip5d/Lk7S315qhD40Lsay55YTpkkUcdamdgDwYcC1BU+ssyz2z/mE4Z9gZO8tFUYKrTx14SK46H+z3atsQnDiRdCK0hm0uludksc2XBhrunN4jGfev8zZ+Jh3GAme2IH3fZJvyibtPAmNCI3r173ZC7Czihg7D+lZCaxMG5KFwRER5qBDoxyQh00JWDXQI+uWsVUPAXeAjQLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDe7PPbQ+4BrnIK8F7zKrnQiM6faN9c6Qs0+vpt5zqo=;
 b=R7xC+9VDfKDUGL8H/9BnQFOzLPL1y+G1TIjeckpDUkhqTLfYwDimzutY8RWJi0UPNdq8zaY3sIhvLFKpg2fknEr5oNZBC+Hm2R9VW5ilemIlAwVMl2cWTkx6pP5mDcPy/TQ+n/+Rdam8rhKpfkGapQ2CfG3wn01+CnBzxyhWInapJoKeB3V6pVWPJBM11IPiUcevXVOFTKt88pZIxakX0oB4bju9HNHKVdK2Af6DeuJ/1yFXMFxlF7iUFniNE3zrDpub1UPVefx4L3KtmvFR/jpmhyMr0eQSHMXO6rUmw/PjVkPPWwrMXvqYZqrtYLWsJxTbJpfdjSsDshz5UXfmhA==
Received: from DU7P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::22)
 by VI0PR10MB8622.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:214::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 13:00:49 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::29) by DU7P195CA0012.outlook.office365.com
 (2603:10a6:10:54d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 13:00:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 13:00:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 14:02:16 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 14:00:47 +0100
Message-ID: <eacef1c2-5401-49fe-bbbd-7bcaa444e798@foss.st.com>
Date: Mon, 19 Jan 2026 14:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20251216-next-v1-0-469e1d901920@foss.st.com>
 <20251216-next-v1-1-469e1d901920@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20251216-next-v1-1-469e1d901920@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFE:EE_|VI0PR10MB8622:EE_
X-MS-Office365-Filtering-Correlation-Id: 21951ac9-0e61-4e0b-4f1f-08de575ac47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVY1WlhuTnVHcllXdjM1R3RKZmlJc1E2d0hoN0MwVCtwbGFXN21jL0lLSUZH?=
 =?utf-8?B?VHBTcDJoQlp5TFdnRUhTOHlJZ3hKUFhQdGpveXlxWTVRV1I5bjlyQklnaFVi?=
 =?utf-8?B?K3RCYzNiRXp1QUw4U1MwdktmcHB5QTJrVkovZ3dLVzNySyt5WkRHdCtnWFFK?=
 =?utf-8?B?VXBrQzUrR0cxeFp5Y0haeVZuMFJvZ1l2WHdob2pmTXRaY0t4Vmh0OWNNbzJr?=
 =?utf-8?B?MktXSEY4ZktqZ0RQK042Q1JDdVFsdlZveXI0SG13VFR0WTZ1aUh0L0dPTzFZ?=
 =?utf-8?B?cENSWjBySEE3MmZpd2JmTkFhcjRlREFvS2djVDNnZjRhdmNrYjU3dEdCejFm?=
 =?utf-8?B?TlJDaFc3cWIwNlZZYVA1VW9TeHlCeGhkdnI5RWZOZ2dFS05tZmxTSlNVclJR?=
 =?utf-8?B?d0E1REU3WWorUzAvaGN4KzZobFlBV3BkVEo1TE9pTjZXMGtDeEo4STFYNkdL?=
 =?utf-8?B?ZWgxN09odTdIL0kxOUc1alZGeFRwS1hjayt2alhTem1KMTVwcmRUVUpQN2J4?=
 =?utf-8?B?aTA4N0lUeGcvMjYrKzNwWWFlZFFKL1htUlVneWtUeDE3dy83VG0rdTJGYTM3?=
 =?utf-8?B?aU4wejRwdjM1SEZyUDd3a25lZkVRakI5dnNkeXdpdE5BOEFLSDRKVTMwOUFs?=
 =?utf-8?B?N0VISEErR1VNUFRBZ0FVcDh5VVFZYTkwK09rVUp6My9wZUFTQnRPWnkvSnkw?=
 =?utf-8?B?dHV2K3FXdXlHWlNWUjhabVNXY3FDcTZ1WExZTTcxS0lvRWJIV2lHUkxzMTh5?=
 =?utf-8?B?QjIrOXdmOEpCTUtFYnNlM2xYL3hzaXcxdityRFF1eENDV09qamVrK3plK0k4?=
 =?utf-8?B?NTJWMU41alZxMkNxLzRIU2ViNVZTTlZ1RzQwWVZxb2xLb3ppRTJ3MmE3eElz?=
 =?utf-8?B?a2YxRUo2VHpkYlhWekhjL3U0RFd2NlBlRitrTUQ4TW5NcE8rTzZ2K3hNaVlK?=
 =?utf-8?B?YUt5RlRKRWJFQTZhMFNrTFVlQTRlcnNaSVJDdElyOHJSRGVYUEZuQnRxUmJa?=
 =?utf-8?B?Wkp6bUk1VHV5Uk1UakxhWlpNbXFRcUZ1a1dOc0MrNVBvcThTU3NKRkFXckRT?=
 =?utf-8?B?QzBaT1Izb2ZrNUVQZ1FNNFEwZkVVNXNwNTloRk5DN0FhTnNCVE13WkhxcUdt?=
 =?utf-8?B?ZGRHN1p1Mk5WY2ZMUnRiVFpnYTFqQ1EyS1hWc1NoNnVNcWFWVnV2N0V1bE11?=
 =?utf-8?B?WmlRQ2d5QTJWUFlISHcrVWtKOHRrRjlZMVZvcWtucVhWbVIwdEUzU3NNWGhK?=
 =?utf-8?B?N09ORFBhdzMzNmQxUzNLMytPNVltWkZTMnQwZFR3Z1d0WHNFUTZnMnpYU2pm?=
 =?utf-8?B?RUtET0krQ2FyamsxK1dmMVlvQVdJR0FPWE9mT0lZanRiaG53Qmd4b2p6UVZ3?=
 =?utf-8?B?ZkhqZGtkUEY4YTkyRldVSkdSSlRWS2JOTnFROVNUZE80K1paSFdFM0NkR1dM?=
 =?utf-8?B?SmdXRWk4RnBSSHFPWC9YQlVZS1l5WHFna3oxZ2NIUnl6M3UvRnh4VFFjUktz?=
 =?utf-8?B?M3V0WVZVYW85Z3BlOUJqUC8xODd4ZzQ5emhGMElpRmtmRnJ5OUQya0d4aVpa?=
 =?utf-8?B?SnNXeEg1Q0puNU9YeHNXWW1LbmMzSmlRRkN0cE5ZME9iaXlzdVlXd0czWXU4?=
 =?utf-8?B?cXI1VnJXUEJrZ1duQVZ2a3pJcjJMb2hkdFFlbDAvMFdCT1RkT0xWek9YTVdH?=
 =?utf-8?B?K1owcEk3M2wwUlpVQU14MGF4N2YwaFBaWTdubmpwZGdVRUhSa0hzdUJGNkhw?=
 =?utf-8?B?bi9wUDNNWXZpSG1VRVlXN0ZJeU1Ha25kOHkxMGtXVktyekxSVUZralJPOXdx?=
 =?utf-8?B?Lzg3Z1lqTklzZEtOaE5kczNMalNZWEkrM2VCclJ0YXZwdW15MExCMGFqTXRJ?=
 =?utf-8?B?bWRyQURpd1ZQRkNEbWpHcjBQdXR3VkpTNHh0NVEwUDV0WmdEZG04alRGZERk?=
 =?utf-8?B?RTl3cTF1dkhTSk45dXZwd1gvZDZ3K0VmRlJ1bENuV1hGbFFtMGhjd2wrWEsw?=
 =?utf-8?B?ckRKUWpYbTUwVEdoR0xSVmNmMmc0bjlTS09rSzZPU1pha2R0NnlPcThpMS9w?=
 =?utf-8?B?aENwTFBCR1hxd2ZudWRRT1NOZ1M1dTM3S1E4cmU0cGhMS1E2K1VDdnB3YTZL?=
 =?utf-8?B?QjlYMjQrdkNjUE1ISThNWlBXamk1TG13Q29VcUZoN21YUlExN3NZbUp1c291?=
 =?utf-8?B?ZGFNOEhBNWtYVnpjVkRZa3cwaksyWUhrUU1MYXM3Vk53L2NwT3JtUU9YWGVG?=
 =?utf-8?B?QjZSeEU4VS9EL3gydk9zMmVZUmNRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 13:00:48.7414 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21951ac9-0e61-4e0b-4f1f-08de575ac47e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8622
X-Proofpoint-GUID: 796DYohExPu7RkpuumZTzhOo18oq3z3_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwOCBTYWx0ZWRfXwIRNp32IQX6r
 cQVLo3uzWNnUvWCLR2YeJVukL1ghA83kiC+mlsTfZ5fAarcPX4NOCCQ/WqgR/f7KDCEXZhCKMfi
 EkJq16xTM7Mhc9akv9FJVlfcFzZMByBiVSG06n83c/XLSIIqcfUmO9qElJXiRZuEVei6Vj0wpez
 AWjvYet/0/6bUwfQAqnGkV4TzTVpPa88l1Y8GYoD1cTV60VOR1DA6zY3tSIovVfVp8hBrB8Zxp0
 MOQy8iQNRHev1a85J7tuhAAgsmUiAeVEwnc8Ml26z9h4Ea2GQPkQubZjUaPdLrtDvwePDw8pOKr
 2KHHyer73hX0z2BP+H3DhogpV9tvp21hSYoUZxbccCw5gxS6QFOF3T65rr1VPO+MmMpw7JUq70N
 I/7r58Q5zOXH7eszEHx8fphKg10kYX8WxUYCvxBH/NZTTZUoNgj5JRu+KJrGBLwmqRv7CJPAZJo
 VQgyVWmsxEHLev2wZkw==
X-Authority-Analysis: v=2.4 cv=TNdIilla c=1 sm=1 tr=0 ts=696e2b03 cx=c_pps
 a=1ekRL+OxKw2/ljWpMeJ4Gg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vW1nh7Jg1_YA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=obemRq6xgw59ooiNqGIA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 796DYohExPu7RkpuumZTzhOo18oq3z3_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190108
Cc: Tom Rini <trini@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] spi: stm32-ospi: Increase read
 throughput in indirect mode
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
> Schedule() is called every u8/u16 or u32 read accesses which is overkill.
> Move schedule() from stm32_ospi_read_fifo() to stm32_ospi_tx_poll()
> and call schedule() only every 1MB chunk of data.
>
> Test performed by reading 64MB on sNOR on stm32mp257f-ev1 board:
>
>            before      after    ratio
> Read  :  10.6MB/s    14.2MB/s   +34%
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   drivers/spi/stm32_ospi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/stm32_ospi.c b/drivers/spi/stm32_ospi.c
> index 01b8f8e4987..9e143a73559 100644
> --- a/drivers/spi/stm32_ospi.c
> +++ b/drivers/spi/stm32_ospi.c
> @@ -142,7 +142,6 @@ static void stm32_ospi_read_fifo(void *val, phys_addr_t addr, u8 len)
>   	case sizeof(u8):
>   		*((u8 *)val) = readb_relaxed(addr);
>   	};
> -	schedule();
>   }
>   
>   static void stm32_ospi_write_fifo(void *val, phys_addr_t addr, u8 len)
> @@ -200,6 +199,9 @@ int stm32_ospi_tx_poll(struct udevice *dev, void *buf, u32 len, bool read)
>   		fifo(buf, regs_base + OSPI_DR, step);
>   		len -= step;
>   		buf += step;
> +
> +		if (!(len % SZ_1M))
> +			schedule();
>   	}
>   
>   	return 0;
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
