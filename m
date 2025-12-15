Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4C5CBE6FE
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Dec 2025 15:57:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC946C35E2B;
	Mon, 15 Dec 2025 14:57:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D071C36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:57:41 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFEjEaB2295764; Mon, 15 Dec 2025 15:56:52 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b1jk5cyj6-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 15 Dec 2025 15:56:52 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzfvL44TxB/hR9FjHBTO6S0CqbIfWeS3L8FYKgZ7NTRVdH76A6kFXFu+0Zs6CeBBcy+J5uQcC48yclBEsJwhfprp7hQYviW85L/kAB8tfshHHYOlX6CaiFpoh0wN14b1Krtn6cJWkt1ENhJsBamlCElibOK0xy+muh4SQjNEcfq/MDnKA7wFCJw9W2SoRRtg7q7w6ODMkMtdgvr6V/hHLiAGhflPDICbyNPv/qB/z4rfb/V3ggUWkwASMdPYQAWbMTIEYhcGvFfsm9pzo1VOEaTPIy6zvdH/8RpqkG3Za0+YjQOr0ClWCOfgUf08mun5JgR2Nf5jH0ek+SmiTC0LVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+04E5Xp0YCNtzjaGR9us+TJiID3iB78XVUL0ldq0q+M=;
 b=KihegIj2AVAUlCf6TZzVACpx6RmyTvr7ZNhnvkecjRaeV2V/CMAlNVRKt5atcXPv3rW27koxVxwLejHtiXup86qHkpwJ9GpTgAnO8t4sB8IdTmnR+I6UlJWIUagN3r2r7zJSb+gzEA27HmLN4c4N1KEp1CkVYI3DfF4thNHHrY8t1lAqJvlSv4vzPdjw0ec7dVpa5bPaWDkJdw0ySnJM3jknGYGJ4sGs4492oTGVk3b5yf1VAGMn3zgLfSpbLCqp6s3x/zqynUjUlvLN1EMR+wWX1zyf/vD8s6Uj4aTPhIBNrzvVPDcui3myJD/8lpYPNEdfcpXu8Vd18wqFNz4Evw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+04E5Xp0YCNtzjaGR9us+TJiID3iB78XVUL0ldq0q+M=;
 b=NxME3hudPqfgQYFOak/Dvi0jaRFJOtvpqp4tGKve5oD32SLW4Uedf4PGlaf3RNEzwjlS0ksJrBM1QQ2wYE6jn8jFYtyOe54rdnbsCeVwd/v0jU8vgNnGbCDioTMsbQQvj6tWqxmsWgbruRu8tej3A6fw43eAzYOGNs2h+MODa9WvRkRmh5Lo69escvAasKdzL0jfRkyb0bsH2xeG/ogIebjA6gbOJmWgEJCc/FMxcQX1TBOfpsZMB1QOrEVscWzhN9j1AkCjM6NAOHvWnXWZ4HmMM6jMLro3h8sVRq5Co4lfg+Z3nDsOIGSztmUhp7O9naHzTRiKIVkD0gy9AyHs5A==
Received: from DU7P195CA0015.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::33)
 by PA1PR10MB8869.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:440::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 14:56:44 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::13) by DU7P195CA0015.outlook.office365.com
 (2603:10a6:10:54d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 14:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 15 Dec 2025 14:56:43 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 15:57:30 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 15:56:43 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 15 Dec 2025 15:56:41 +0100
Message-ID: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKkhQGkC/52NTQqDMBCFryKzbsRMYqVd9R5Fgj+TmoVGMiG0i
 HdvFHqBwlu8bwbetwFTcMRwLzYIlBw7v2RQlwKGqVteJNyYGbDCWqKUIhBHH8j03kdjfTAcZ4X
 zKtWvYZ2fXRjZJBTU6Ftj60ppqSGProGse5/CZ5t5csfc5/QnPK5/q3IqoTVdqRkJe+of1jOXH
 MvBz9Du+/4FTsv8AO4AAAA=
X-Change-ID: 20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-e7497f503414
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, "Peng
 Fan" <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F2:EE_|PA1PR10MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: cd58a0b3-f1f0-4730-7cca-08de3bea2993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm1obU5CRjVKODROKytKNDdsTERiMDFGMEVSRlVVWnpEOGhSM3Y4ak9UYUtK?=
 =?utf-8?B?MXN5MlZvRzIzdVFRc0NkV2lBaWcvL3gzUjFKd3BwUmJWb0FLUzViTk96emRP?=
 =?utf-8?B?WlBmVG5ObW5DMzA2Y29sUExITHpBaDNFK1prQllhQm1PdnVKYm5GRkRieGMr?=
 =?utf-8?B?RzFyR1FGWHM0d2M5VEc0UGM0RWtlNGJrZGFjei9DZzVsSXFIRFFhV0Naeks5?=
 =?utf-8?B?TUV3dnZRbXFsamNBV1lwL1NzeGxJRnoycEV1VGtIcmdPOC84R2hnam92aGVF?=
 =?utf-8?B?dVpmY0dYTE8rcHZWVUFIdUZmRzB3MFpVOER5QVdsS1NqdEtsdlFGdmowUnpI?=
 =?utf-8?B?N1NBOEYvYytncXo2eG1wYTdFUXkzNXBEMEVBNVVEK2JpYkxvVXJEeDJwa2FN?=
 =?utf-8?B?azZybHMwTlZyK1A1MzhqYmJkeTJMYmRvNE1ZYUVCb01GdnY0ZWgvbS9zblZn?=
 =?utf-8?B?TFRnZVJsSUVNUTJVMGRxRWJYZjR1UlU3OHhzQWxQcktJQm1aVTFpNlVvVkE5?=
 =?utf-8?B?dGd5d3BqNWEwdnBwam0zeUZtS1VpRzh0R00vc0F3ZlpqUUdHZ2daVXljVEZL?=
 =?utf-8?B?aTI0ZWFTdGx4UmtSV2Z3UElJMzYwRjcxL3J6bFRwYVVRazFESXluckRRSGR6?=
 =?utf-8?B?em5Lc0JOQ2p3ZnB5dUQyaUxPZjN0N0xIMWE3ZDRIcjFkbDI2OFpDTFpteFFM?=
 =?utf-8?B?NG1VcHpsV2hwWUcxaFlPWlplR3h6czhDZ1B4RExtck5ManU3eE9tdzZLMmdD?=
 =?utf-8?B?RXNOSzdURnNrV1BYK2I0MTFVdElXTGJMN01ZVHBUQ0NERnJ3VzJKSXFnbmxB?=
 =?utf-8?B?Sis1SlMyYzhIYWRmUVNDcC9aUmFBMGxaMkRyVHlldExScDc2V2hTdGJDQlE4?=
 =?utf-8?B?bWlLYVBScE5UaU9URzhBZVM2dG1WMktjWUVybUV2bjBuUVNzYkRuZFVoNk16?=
 =?utf-8?B?UHArdVp0djFNeXpaUEVBTVhjS0JHalM1SVJRa2swZ3pUUHdhRXVUZmJINUdv?=
 =?utf-8?B?bE5UeUQxZFVyL1JWOXc0c0N3SlNZL01OZXd4M2pnTDNNOEZocGRYWWxKUjQy?=
 =?utf-8?B?ZU1uMmdDbVJKVVlVVVBOellmbWtXWmVyOUZyQ2tmdFdZVmtOZ3V3djJpbFR5?=
 =?utf-8?B?NStCdUZ3R3BzT1Q1SC9DVnRnZW9wRkduRFFtdE9wVWkzUkVOeEttdGs1Mm14?=
 =?utf-8?B?a1RxM1NhaWFqZitKeHJrd1k1QS8yUVR1VXQ0N3FOanVNeFhMRmhkMWJ5ZCt4?=
 =?utf-8?B?Z08yQmtuaGJqNFMyYXVRaE5yb0xxSlJscll4USswRER6RnFLUnhpZXBYL2NY?=
 =?utf-8?B?MlBZclBDOXlyLzM0ZWhOWXJ1STRWZzVmMEsxbHg1VHh5a2NNMjl3VktvdXVj?=
 =?utf-8?B?anV4VE5BYVV2RE1DeExVNTZLZytCY25kOU0xNG1JaVlvR1ZOM25vS2htN0hw?=
 =?utf-8?B?U09CRDgwU0RNOCtlMGMvZUZQakV0bG5XV0xma0lEaUdXK1JqdnhSOWkxMVEy?=
 =?utf-8?B?eFNCSEpsaVV6eklVaHg1ZE1nSjIrdEM0cjE0dnpSSUR4dXhYMHArc0k5RXk5?=
 =?utf-8?B?U2FJS0tqamVGcWdPdE9LVkc0bEovZzJkZnZFK2sxUW0zUkpzMGtaMHY0UDVF?=
 =?utf-8?B?MVVndjlSY3dxZjMxeTliV3FlTWlDa2RtYWZIRHpIZG9ac2ZVVGVQam5FSWMy?=
 =?utf-8?B?c1o2UzFiV2laS2FLRVlJbm9jL2xSaFFBUGRYdURlcmdLZkViWVBKd00yNjdD?=
 =?utf-8?B?WU4rQ2U4aVk1dFljWlNFRW5DQVVmVXBScFAzcDFOd3ZwWW9jWVhUMU0raVBv?=
 =?utf-8?B?aEVEU2EzeVR5a3YrZHQzK1JwcG1EWlV0czVmbmhzRG10eGxHZHJoR3ZDcHdW?=
 =?utf-8?B?b2tUOFZpZUdyY0NhU00rUnFWMHZJNTJUZElYcG9ZaEJKZzdwOElkVDNYdVYv?=
 =?utf-8?B?WjQ2dGp1NE8xbEJjZE1tT1dINVozbUtjZGY5dmVVK1pYSmlQN1E1YWlwUTFQ?=
 =?utf-8?B?aHE4Z05LNE5EWjVlVEgzZ0JQZHo2NGx4OFgwUTBEQWVPdjVjN2E1YzRIblND?=
 =?utf-8?B?bFBRSER1bStKUE9hV0lYeSt4MDhNUUxKYVkzZFUxS2dVU3AwR0htbk5kc0JF?=
 =?utf-8?Q?phiE=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 14:56:43.7981 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd58a0b3-f1f0-4730-7cca-08de3bea2993
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8869
X-Proofpoint-GUID: VbgNz9U_XY_zcWc3FQ6KdayhMR7A6FH3
X-Authority-Analysis: v=2.4 cv=NKvYOk6g c=1 sm=1 tr=0 ts=694021b4 cx=c_pps
 a=USthxGBMnoyjuKxaiL7kkA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=c8P4vPNukFRfR9deQPIA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEyOSBTYWx0ZWRfX2KYOaSXuePgI
 Z62lsaES7hw5QdRDj9IQtIw9mkVVhN34XllATh7rrWczGL4BcG9dZxPwnNqpYUx60YrGSrj0xjI
 15JaL4Q/9pNBJBkjsz+fnc6lhmaOPMVG3kc/kPa3HbPFZMsypSQHnQR6Ap7dT3RnxMxNu945EKo
 rCDVSyu9/y9yTZxTbqWlaF794E99xczaBFOONPBJho+oawEImbO0rK2oDqJWP/g7w01c8wFFFvM
 3itr0GG54+D3RvcpkDSHEB/2+E9ItxKVXQw5jBcpR8Y7TxQz/42hmnFkR/mJuv7uOgPRve/fUBW
 dSV9xENshfL+Qro2jKXrKL80a4+eUvWzGzS177BwNiLAtZge8N0KqWi+fjVHt1PXk56hbEaEFHQ
 ZoE3wMOEFeMAAcR+iFLdO7d3ive3fg==
X-Proofpoint-ORIG-GUID: VbgNz9U_XY_zcWc3FQ6KdayhMR7A6FH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_03,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150129
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 0/3] Restore boot for STM32MP13/STM32MP2
	board family
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

Commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
is breaking boot for STM32MP1/STM32MP2 family board.

The issue is due to registering clock with default name "scmi-%zu".
If one of these clocks has children clocks, it will generate an error
when trying to register their child's clocks as shown below:

...
clk_register: failed to get ck_axi device (parent of qspi_k)
clk_register: failed to get pll4_p device (parent of spi2_k)
clk_register: failed to get pll4_p device (parent of spi3_k)
clk_register: failed to get ck_hsi device (parent of usart3_k)
clk_register: failed to get ck_hsi device (parent of uart5_k)
clk_register: failed to get ck_hsi device (parent of uart7_k)
...

Clock management update for STM32MP13 and STM32MP25 SoCs family
to no longer use clock name to establish relationship between
parent and child clocks.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v3:
- Rework clock management for STM32MP13/2
- Link to v2: https://lore.kernel.org/r/20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-0-44e6e7de2beb@foss.st.com

---
Patrice Chotard (3):
      clk: stm32mp13: Reorder include files
      ARM: dts: stm32: Add SCMI clocks in rcc node for stm32mp131.dtsi
      clk: stm32: Update clock management for STM32MP13/25

 arch/arm/dts/stm32mp13-u-boot.dtsi |  27 +++
 drivers/clk/stm32/clk-stm32-core.c | 111 +++++++++-
 drivers/clk/stm32/clk-stm32-core.h |  39 +++-
 drivers/clk/stm32/clk-stm32mp13.c  | 441 +++++++++++++++++++++++++------------
 drivers/clk/stm32/clk-stm32mp25.c  | 405 +++++++++++++++++++++-------------
 5 files changed, 707 insertions(+), 316 deletions(-)
---
base-commit: 0e0a198a68be71148f5ec27ef86796174f91436f
change-id: 20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-e7497f503414

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
