Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA87D3A92C
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 13:40:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DDDDC8F28C;
	Mon, 19 Jan 2026 12:40:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30921C8F27C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 12:40:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JCAYax613717; Mon, 19 Jan 2026 13:39:44 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4br0e95mbq-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Jan 2026 13:39:44 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKVffP/qNJjvJsnNJa+IhBENYZuYVXLtlh1mSdAvVHHN+a/gcA2px3i4OMZVqGW1qC6JHrtA1AK4RI+WRncYjUg2gstja45sVqkShXsXsLXz7pixXoGC1ZZtJCiOoRfPBRw1qNoc9f2OvqUpn3NRf+LCoYdZialsnRHmPT1IyNVua9DLq4KRhuxChMV8ngSEWIzQkfEQLte1+p+DhNwoHnr3Cy4dLsgs6RffWlVeMqpWgDDDmcayFYqowDEPB/b3d929zfoQtqm7MEh+n9U8RqTFlFdKpTzj6R4bZPvxbMbnU1UNoyL1mbdhBMCBvjFv81QAVELo1uOIcWNAOgHQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktjppQlAoCkDlyXbKhMyKl9BqK43KwBCBPFjQoHojd8=;
 b=jD4pHsHiaaiipnf/fluISHqiXGzKnEhco8IVNF2iZrGOFfH9EtU8xcABk4vjUNYZUcs/mi0KZklkeNIWxyzq9vXsXPFhyMDcCPPWjcijr+jr+h1nowC0AmCqp4UBzrbldW02VT3FqdcJT8gAGpb/gFBTRvTvq2OsjXZb51SdgUGJMS9UB0qTPq9qp0ttS49b9zMEP3HC2e8XKPf4NE+dFhor7aq7KEQ30Ouj0r9hfAhO0j0StPeZNm8SqcjSq5jcPnNCyw1rkO+nE22Hka7zTBuUrK7IczYj8LzZIh50XIdmfdC+IXN+wCCQ/nC/Y9meVMEE736quN8Ws7LWOO9o0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktjppQlAoCkDlyXbKhMyKl9BqK43KwBCBPFjQoHojd8=;
 b=A9Bmnh4IOCDUrbi+Z/3gRdYoY5Y6OA+gqvQgHHQtQFroElerL48RHtxDyk+9Ab6o25Xq4QtOlb+L6k0d/ptH6kwrYExtbuFyr6EyTphNZ15O8W7oXhPCrG6RzbM1qNVFrI/EJPH8MtFQ8NGw/kPBEaQTsP52Y261tviCC6WRCOmMTp10ENYwFuDzAu/gIbO17X0Jzc01OHu7nt+9ByXjvmYqisxX9yJ8h4h6cFjxrbjUuYEHVLf3rWQjKut5tRa20ryY39pJlSfLEmc2snmboLxRNSE7d2xg5zdypceT450eE9hwbTmhbXd6Q3D2buQxZur+lYsUyYYUCo0qm/J1fQ==
Received: from AM0P190CA0008.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::18)
 by PA1PR10MB8537.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:448::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 12:39:41 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::54) by AM0P190CA0008.outlook.office365.com
 (2603:10a6:208:190::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 12:39:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 12:39:40 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 13:41:08 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 13:39:39 +0100
Message-ID: <17d5918d-2819-47b4-80a9-e14eb049e391@foss.st.com>
Date: Mon, 19 Jan 2026 13:39:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>,
 Peng Fan <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
 <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-2-d055da246e55@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-2-d055da246e55@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|PA1PR10MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4e3543-033f-4f64-3eb1-08de5757d042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0dIZDhBbE12dEVEaVNTYzVNMExEN3BqNW1pODBOc0hSMCsxN2xodXQwamxz?=
 =?utf-8?B?d1VBNnpuVnlBaWljMU1JM0xEVFJ3Z3FmeWJTUnpmRE9rN2lvRDZ4REFXdUE1?=
 =?utf-8?B?QXMvMVBwSWpEZnF1RFNDU2cyR0E4MHFlTnlUUGVyWnlDc0xFQTJNRTZpTUdx?=
 =?utf-8?B?dmsxU0FmNCtBSW05cWhNcTVOUGk3azJnQ0U4S01YSi9hT0l4azI5Y2RkRmN2?=
 =?utf-8?B?VGFiekIrWEIyTGkrWkg4d0pBQjBiYVNCcDZ3bk9ZT3o3WGhZL0NDQXZ0SVlk?=
 =?utf-8?B?NlNacnhVTHFOZGhVOXppQXZnYkdLeXBFNzluZ3J1N1oraVN2blB6emw4R2Fn?=
 =?utf-8?B?WTZieWJ6d0ZyNFRYZ0Rwb0Q0N0g0YXloT3FXN1grQXhnMVF1UVZaVW8xSzdJ?=
 =?utf-8?B?NUxzekwzbHRYZWhlRzJpd1l3SFplT1puUVVKa1pLWm5MNTlXL056aDZtT05p?=
 =?utf-8?B?WjdEaWdFN3h0dENVeGFndDFycDNFb1A1cFZJa2oxcXI1L01hL0Nmd2xhSlJr?=
 =?utf-8?B?TmdNMFp4clYwdE8yV3RuYjMzbGMzaFZXRUZJdHJWWG5vQlVQUjJBZU14T3NO?=
 =?utf-8?B?WHFMQnhjNTl2UE5NL041ZDNOLzExR1VaVVk2cS8zVzgxQXQvdS9RK1BtbXpu?=
 =?utf-8?B?RWxiOTRqWTZ2ZWJ4N0hleXhNSHYxYzdCNmJIS3BoN25Zc0pteGt2YVZHNEha?=
 =?utf-8?B?ZGF1OFhxbEsyZ1ZidHN3Z3o2Qk55a2paSit6NGl2OVpTMjJPVVRsY291cWxU?=
 =?utf-8?B?VUFYbURkRmNySHB1SE1ZbHpSZXk3ckxnaVV5QnpreW10Qm1ha2I3azBRRE05?=
 =?utf-8?B?VGdGTTR5U0kzditpei9zMkF0L1Q0Tk5NL2xzSGhKK1g5aDl4RTJlTFlTRWk0?=
 =?utf-8?B?dW1kbGVnbEdzNFlMb21CdFo0bW1sYldGOHl6NGRZMXlGMWNNYlhTOS9IZWd4?=
 =?utf-8?B?RTdPSVJiaDFSY1VmWndhS1RvS0FrOHduZlJCb2J5RFpwdFAvc3dJLzJEaml5?=
 =?utf-8?B?N0JxRzFjd04xaHVveTJSOXl3OTlYYUpYd1MvNWNzTk5uSUF1SUttZTFTWVFK?=
 =?utf-8?B?S3dXc1VZdEoyOGoxYkVZeEZWeFJyOWo1Q0NjMjhQdnJTNUFzMENTaVVoWnh5?=
 =?utf-8?B?blZPWElLQ2hwNjlkczRNNG93ckx4UHpBamtNYUgwTmhoTnhpaHZicDBBZE9Z?=
 =?utf-8?B?UEZhQUdEcnhsTVhObjdaRGg1cDNwdnY4S3FaNSt4bXplVGNGN3dNTG1WeU1C?=
 =?utf-8?B?ZG9pcDE5RHZFNWdGaTgrczY1MlRDVXV5NlJGK0FQTHpkSVdjdVlpYTlRNzlh?=
 =?utf-8?B?L0prR3pFQmtpKzZpUzk3UDYwakJnVUR2WlRnWDFqLzd1TnRJL3Z1WHRDaUxR?=
 =?utf-8?B?MnRXdDB4RDlXU29mS01QZUxuZXMya25ualZkNE0yODJEalh6Qk5rVkZ3WWVI?=
 =?utf-8?B?ckxJczM5bUJmZE5mcDNxRlhPNElvVFg5cVlER29Telp3dWk5ZHFCVENrMmhi?=
 =?utf-8?B?R2cxbGZLV0FWaEgzaXIvSFE2VDlTaWNjYW5ydis0bjVtajZFcDUwbCs2TmVZ?=
 =?utf-8?B?Ukh1ZDVCYStibGpKcEdTcTVDdUVrN2YxSHBHMmFnVUJ5MDZVNmcwR0U2MmxB?=
 =?utf-8?B?YjlMTHUvNjRja1BDT3crMUN1dWdDd1dIYlRBakNGQnZIUG0zV3h5M0Eybzhm?=
 =?utf-8?B?dzBwUzdScTBuR3JvVUk0Z0dwNll5dlErZzVsb1B5bndNVWFxZ3U4LzVkRFZv?=
 =?utf-8?B?bC9aaU80YkVCTEloNjkvUlVtU0l2clpzeDQ1TDhMT0E2TGRZdWx5SDlueWxS?=
 =?utf-8?B?RUZLdWdIeUhWc0ROYktyZ3dqdlI5d21Wb3N4enJvT0VkT3k1emFPWEloWmpG?=
 =?utf-8?B?Nm1vVGZXRDJPOVNNd2NXWnVGdHlPTjdjVnFMWnlPYXppTkpQZkhDNXRSd1E4?=
 =?utf-8?B?bTcrQmU3NHpMc2k2QkN5OG42TVZhQkF5SnZySkpyazB6TzhWelpxM1pSUGh6?=
 =?utf-8?B?TzlNalR0QkJ1aFBsbi83TGVndG4yNXNidU1MQUtydmR2SENaZHZVZmxibTlK?=
 =?utf-8?B?ZXI3TnNZSmMrYkhxTEppZ1I1VFZ1QldvZnVxbXFabFk2M2NZNi9aOUhFUXJv?=
 =?utf-8?B?cC9NTFVpLzFIVm1tWE1qb0dyYzg1VTY3dVJCcjVtKzZkNmhQZHBUUkxmb3Z0?=
 =?utf-8?B?MHZyZmRSU1VLNCtQVmFLNkVWTXF3UGxkMS9TL1VBaWZhbmdyQk4xOWFvbWZ6?=
 =?utf-8?B?RVA4RFZuWnJrZHpJL01ieDk4dTZBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:39:40.0069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4e3543-033f-4f64-3eb1-08de5757d042
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8537
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwNSBTYWx0ZWRfX76gOha6ehV79
 Ttrd16/PyJsOFg5k144zDFv2jl4XHTubl1HLuOjRlYR7fiymn1jKOffY82cPPH9UcukHGxydXE/
 deEctUleT/PkSHQfWoCng0/skCCNcvkJJ9YmVvVp3VgCWLfGlkv/O1Jxdio1hLTBTm0Ans3Ujom
 ia3ZOSf2IpKT1cZ8U9fqQGkFIuJkM3b7AiJ6WvLzMjKRR75ee9dUn+gb29ApWcStF2s9XjcVgy4
 f1PTw/kEwy91Ca0Kfbww8PZlHsUzeehQ1auM7cyvPr+HhCaQFJM4kdF2j0+aC324AT3kwmFoM7t
 hHsAGfTxsnzMeFRppbtGqU5GxLi4ENSPogHBVcdNATRquT2N9DpYEYdJ0CkxxSC/qzHQFgRswDv
 hZM9R/a4ypnBPDv3afDcSynXzwcvrWEoS7iICCSVn7l1VLOSg1gottiyfTmtKLqtlY2Ylcv90cU
 LPkvQyLlmA47gsOfmNw==
X-Authority-Analysis: v=2.4 cv=ZOPaWH7b c=1 sm=1 tr=0 ts=696e2610 cx=c_pps
 a=C738UIxDWZtlaVY02jKDEQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vW1nh7Jg1_YA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=WeavhLENqrrCZG4pG3cA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: PTA0oYRxX5lNyWlhaV_MBlcP8_WWkEsr
X-Proofpoint-GUID: PTA0oYRxX5lNyWlhaV_MBlcP8_WWkEsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190105
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/3] ARM: dts: stm32: Add SCMI clocks
 in rcc node for stm32mp131.dtsi
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

On 12/15/25 15:56, Patrice Chotard wrote:
> Add SCMI clocks. These clocks are used as parent clocks and are
> referenced by their rcc's node position in clk-stm32mp13.c
>
> Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/dts/stm32mp13-u-boot.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
> index ad63d5027b2..623c796cc79 100644
> --- a/arch/arm/dts/stm32mp13-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
> @@ -186,6 +186,33 @@
>   };
>   
>   &rcc {
> +	clocks = <&scmi_clk CK_SCMI_HSE>,
> +		 <&scmi_clk CK_SCMI_HSI>,
> +		 <&scmi_clk CK_SCMI_CSI>,
> +		 <&scmi_clk CK_SCMI_LSE>,
> +		 <&scmi_clk CK_SCMI_LSI>,
> +		 <&scmi_clk CK_SCMI_HSE_DIV2>,
> +		 <&scmi_clk CK_SCMI_PLL2_Q>,
> +		 <&scmi_clk CK_SCMI_PLL2_R>,
> +		 <&scmi_clk CK_SCMI_PLL3_P>,
> +		 <&scmi_clk CK_SCMI_PLL3_Q>,
> +		 <&scmi_clk CK_SCMI_PLL3_R>,
> +		 <&scmi_clk CK_SCMI_PLL4_P>,
> +		 <&scmi_clk CK_SCMI_PLL4_Q>,
> +		 <&scmi_clk CK_SCMI_PLL4_R>,
> +		 <&scmi_clk CK_SCMI_MPU>,
> +		 <&scmi_clk CK_SCMI_AXI>,
> +		 <&scmi_clk CK_SCMI_MLAHB>,
> +		 <&scmi_clk CK_SCMI_CKPER>,
> +		 <&scmi_clk CK_SCMI_PCLK1>,
> +		 <&scmi_clk CK_SCMI_PCLK2>,
> +		 <&scmi_clk CK_SCMI_PCLK3>,
> +		 <&scmi_clk CK_SCMI_PCLK4>,
> +		 <&scmi_clk CK_SCMI_PCLK5>,
> +		 <&scmi_clk CK_SCMI_PCLK6>,
> +		 <&scmi_clk CK_SCMI_CKTIMG1>,
> +		 <&scmi_clk CK_SCMI_CKTIMG2>,
> +		 <&scmi_clk CK_SCMI_CKTIMG3>;
>   	bootph-all;
>   };
>   
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>


Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
