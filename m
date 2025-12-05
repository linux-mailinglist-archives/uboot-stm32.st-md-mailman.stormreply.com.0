Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7194CA7A71
	for <lists+uboot-stm32@lfdr.de>; Fri, 05 Dec 2025 13:54:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 960D3C628D4;
	Fri,  5 Dec 2025 12:54:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4240C01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 12:54:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5CgBN22463921; Fri, 5 Dec 2025 13:54:10 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011011.outbound.protection.outlook.com [52.101.70.11])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4aub8nc20p-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 05 Dec 2025 13:54:09 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uf2C+2jNwyi0AJEqXTbwRNYckpbJ9pTncfjwYnKdSklN7bGqqkhVlvo/jqggcM/673j4thwjxGVVQVCJ2GwuCqkWdqQfnK1xY7sjc3hOz3fZOeZ3VoGgIz6ZHrWv8eUXAPCeQ8MYwuOTrRH+wiIeiJXC3+9rljGQY98kri1eAThk+PZAcZNBJmgjhg9jsFkth6cFYQ/VOqYn/gGWjxfOqqAJ8Jx1UvPI1o9ipukhoRplR9x9fmBPGsTKQQ+I3wTs4tpnVmuyo7v92PAtUmabIn45Qvg5DATT6BPbpNO44XzwmAW7C8DJ4RUZDUrwRfNnuCMYEat6mBXqNNlUZpzaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RX8yW67Td4Ccc1nAhVmwI1/ajqrMb3JF0WSwR4Y1bD8=;
 b=xDWVB6+6WXzCQdVHzVRkvgFqm6StxsJFx9bdlPht8anqnRkf1RM+g+2SbM/1X9tuFqx5dQgpU/EwsDt+852ujORS9W0EK8Bo3TwzhgIIDz+KO4+gO7JqBHGlu6AK27JQsCDQuwLidAxcA0qtUPyKYPlP5cZZLYBgGTTjkDzsaltd0uDs6umxNeVEMpy//kxDIubibnAO6w0D7xEHQKIHB8ZI1sPAUmEpYtIW2zX+qSYCUCbiyJH1g3b8sU2JQGsdJyl9PYqPJXzEz/c6wZ01qXfMWsZxZcExIFE/7x/WmAf7jSa0satxM3Vt0UWbuEnnJ5TVHZ/9AwMcEHCbD03DOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RX8yW67Td4Ccc1nAhVmwI1/ajqrMb3JF0WSwR4Y1bD8=;
 b=YOJPPbsi6Yk5605EdkaO7rMT8auEgWVH03zn7USfzzo8Kdf59CLrQUjJaE+MJ5OBGGk/bl5p4QQ0ldErJBZDYekHidamIF4ROOUPZApgxRHy3Fdw4l+nORMUHhQSs6SG2BVh4QdQ6qYabpTfmqyiztX47xoP68fzOJ6iV82nFu8bNB3rJXjYgA5tvOTB4mg3d3yrPsHN9z3A/FpwPN3yiJFKV3MrfLoVYxJDsDL5cZqg6z5oYgaT70S/bZfMGHAgrXQRB53KZxkQ+CaLjsiH12sxJHbfp7/c4dxUUtOFjvJ4unwIl/qNsSFkj2p/zJRo1US3fi1qAZGGZoQX7ROM0w==
Received: from DB3PR08CA0029.eurprd08.prod.outlook.com (2603:10a6:8::42) by
 VI0PR10MB8694.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:214::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 12:54:05 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:8:0:cafe::d7) by DB3PR08CA0029.outlook.office365.com
 (2603:10a6:8::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 5 Dec 2025 12:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 12:54:05 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 13:54:45 +0100
Received: from [10.252.31.202] (10.252.31.202) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 13:54:04 +0100
Message-ID: <b2784a47-66be-41b6-bb91-9410a2785e6d@foss.st.com>
Date: Fri, 5 Dec 2025 13:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251118231732.577952-1-marek.vasut@mailbox.org>
 <a176c021-f748-48f0-aa4c-572dd275ac88@foss.st.com>
Content-Language: en-US
In-Reply-To: <a176c021-f748-48f0-aa4c-572dd275ac88@foss.st.com>
X-Originating-IP: [10.252.31.202]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|VI0PR10MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f27067-6abd-44b4-16dc-08de33fd5f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVNXb0w1akZVd1RwaDN4UTJWdkFIekY0UHBpSW1DekFHbmhmODBtMnFHTDNB?=
 =?utf-8?B?cjV3K0h2T2Q1dm1CMVlLN1hMMEVvVk5ySzYyeWFYeXF4dVlTUzhYMUZqaldN?=
 =?utf-8?B?Vjg4WWVVVHVsNDJRV2NXTVdoTC9xaTlZT25TcDNqc2tudlJGM1Z0Q1ZrYVRS?=
 =?utf-8?B?SHREWncrUXRCK21INXhaMEZtZ0d3eEQ5MlZ1Y2ZCb0tQL1VkcGVEejJKbEVW?=
 =?utf-8?B?bGpUUHEvaHI4UGVxNlhJQlZUKzJMSDZGZG9OYVREY3A1aGg0OElXV2gwTUFl?=
 =?utf-8?B?bCtIanY5ZG5qYVM4dENpTCtrZW9GSHhGSkJNRE1BVDNFL2NZRGE2OUtzMXJW?=
 =?utf-8?B?cVVXOTdYVWdtWmhRcDB1K09ORE1kbFQ0T09VWE5hdUFkTWJWbmgrQ1Q2WVRO?=
 =?utf-8?B?RnFEU2pzMlRWb0RzZkJvYTQwZk5vZFhvVEJuWHEyc3p2eEZQMGxTV0VZWExv?=
 =?utf-8?B?QktnNUpReHoyRmhpYzZhMUU2SktrUkQ5aG5uRDlpZ1VSTXc5Qm1TQTg1TFIz?=
 =?utf-8?B?c2xUQWNhdDhCTXFGYUlNTExTU29pL2tiR3gvWjJacXZEVXhsY3RDd2Z3OFVz?=
 =?utf-8?B?NU1ERHZIUStrbGVKeVhkdmxYbnhjbm1kZlpUeHVIK2liLzRKQ2QyRVpzT0FK?=
 =?utf-8?B?dXVTRzBmYnRrS1hEeGNQOTRkK1ZIVjZuRW5UUmxwR2tlVllSeWowZkN0QVN2?=
 =?utf-8?B?VllPK0FaT21Za3pCT3NncTYzTDA5bFVnREppcXJyN0VOMEFvYmdpb2Q1eW1L?=
 =?utf-8?B?YWN3eUZ5eXNDcXEvVzJ6WnpwRTdUZExTZ09JNjd3NWgwbnNJQWZLZ3BYWitk?=
 =?utf-8?B?Rm5YZGtVRi9OaHViWEtuVVIrZ3dmK2JSdm5WWDR5MTMzaFdiWlJXd2Zja1pi?=
 =?utf-8?B?YUtlVERzZVI5MUJlWE5nKzJkeEtkTlNJWlRJeTk0YklWQXpmRDRBaXg3M0ht?=
 =?utf-8?B?NzNWMkY4N0pxZGhKbW9yTlBYRWZaZnA2b1RxUnJhM0VONnVIN1ozUGdYQllT?=
 =?utf-8?B?bHhtaExTUzY2WllWbWtQS2MyTmwwNFl4NDJiZERCRlh0UWVXNjZIZENuemkv?=
 =?utf-8?B?YWJwREhzTjZyRy9RN0FSUWJ0M1l3UEoxckJOMEd3M3dMZHV6T2tFZGVXRlRn?=
 =?utf-8?B?YnQxZ3UzSmNmTmpDcStvMEVOb05aM1l1azJvQSt5OUFkTUdQOWxrWnVmbUxu?=
 =?utf-8?B?TDVSNUJUQmFXRUFoSTVJeE9qU2g1YTRtM3IxMHlDaENDR1RoL0Z3ZmZPZ3JZ?=
 =?utf-8?B?Mk5WaG5iUE84cDhEblExdjFOWi9NNzZ1OHRoY0ZHdzJDU0c4U0V3cG5JdTI5?=
 =?utf-8?B?T2U5b2E0YnBKeUFGNnh2SXpuWjk3M2JVVTRwQVVxZ2NFcU40S256RngxMUNV?=
 =?utf-8?B?bUljb1NoekFvTUxGcmFNOEdrSjF5TkU1WVpUeUtGRzZoTWloNUEyejJTMVRy?=
 =?utf-8?B?NzJ1LzljVVZ2Mm5HZTArNDZUUTJkUWpHOGc1bDQvK210bldvMDMxT3JZcEpH?=
 =?utf-8?B?K2tJQmtyWktTc2hOMURoWitqeE44bzJ1QUxIVCtXbTAyRTBOMzZFanRYSitB?=
 =?utf-8?B?NVhOUldTR1ZqbWJMLy9RODUxemlVS0h4TW9WSjBrT0h0ZlkzWHk1dGNGY3Q5?=
 =?utf-8?B?V2lWclQ3SFlXdk12SFo3YmliWU5aUHlNYjVaVzdGeGhpU25oUi9TYmIza2VH?=
 =?utf-8?B?K0RVWDdXMEN0T0NFbEpUTVJyaUhXRDFDd2lGVlZMaC9KV25sSjJheldwZUto?=
 =?utf-8?B?V3MxMlVNTTdVTnlsUTNjMjVTQ2F3UzUzMFhvWHRYVVZFV0NyclhvQjZzVFN4?=
 =?utf-8?B?dTkvV1VZTUVMMnZ1Q3REMW13aXFEcmw5RzFtWDRLUFlzQXlnZWovSkorMGds?=
 =?utf-8?B?cWRXQWpNaU5kY3hxUEJPS1VhNkplcW5nRjhlbjg0SWczS09WZVBiejRQS3ZJ?=
 =?utf-8?B?YTNlby8vUkR4ZXhnMVIvZjdhR0hBQ0ZSaERSclBTa0w0MmtvcWJ5NmlBSExI?=
 =?utf-8?B?MWpnVXRwNG1iUnQ5Ty82VE4rRTBtSGZaV09MdEErTGVVYSsyVUoya0gvNy9i?=
 =?utf-8?B?UW5GdndYWm1ONFFJT0hzdXQzcUJKT00vU050M0kzSDBDbzNvVkQzT1VYVDNk?=
 =?utf-8?Q?/0R4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:54:05.0469 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f27067-6abd-44b4-16dc-08de33fd5f4a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8694
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5MiBTYWx0ZWRfX3yRaaMljochV
 qOHqxX/hbSOXLSP+QbGrsOSVX+hXcuEourW8ZWDqc6eg5/bUbCe1NjCfu6BRgRgnNXEkQGivLKO
 uRqAh/aaAcLQKW7DvtRmqaD6vJ8sqYEOdHi6LbGKSdYU4eO56k1yqikmavIhoG6LDYdGDJcC5zp
 UMAgMEcJWGwVanJEknmQK1k5Y1XRCzud5FkX+HqvAWefygPaYjEZ14H6jffF0Dk65Ex8ytF3pJE
 ULLCbGZ7Z0xn2fv8op/fNX0v6IRKuFy/hUQ7xBhKIAep0EFsrvq578XtevWgQfJR0q1V+iNc909
 7ZC23yV2Ay59Yb96OLk795gFjYhd26Qsx04M33eYWwq9v40Bcwb5iJ1zMTMloXNmrE8pp1jkHh8
 Ni7o6KHv8W1rNytxvRibYiXoCx4dIQ==
X-Proofpoint-GUID: _UZXDXVxCEIZ1KpKz3OXYvjexhI2xNW0
X-Authority-Analysis: v=2.4 cv=X99f6WTe c=1 sm=1 tr=0 ts=6932d5f1 cx=c_pps
 a=qL/VMPmVWWw7LBH4Adirjg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Uo5EeBN78AAA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=TBhRiez3MxTnlp_gcfEA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-ORIG-GUID: _UZXDXVxCEIZ1KpKz3OXYvjexhI2xNW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050092
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add missing build of debug
 UART init code on DH STM32MP1 DHSOM
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



On 12/3/25 15:23, Patrice CHOTARD wrote:
> 
> 
> On 11/19/25 00:17, Marek Vasut wrote:
>> Commit c37a6684818d ("stm32mp: fix compilation issue with DEBUG_UART")
>> split the debug UART initialization code into two files, but failed to
>> update other non-ST boards. This did not lead to noticeable breakage
>> until debug UART is enabled, which is not the default. Update the
>> Makefile accordingly to allow debug UART to work.
>>
>> Fixes: c37a6684818d ("stm32mp: fix compilation issue with DEBUG_UART")
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  board/dhelectronics/dh_stm32mp1/Makefile | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
>> index 2f4a301d1a0..429e01453bb 100644
>> --- a/board/dhelectronics/dh_stm32mp1/Makefile
>> +++ b/board/dhelectronics/dh_stm32mp1/Makefile
>> @@ -3,6 +3,8 @@
>>  # Copyright (C) 2018, STMicroelectronics - All Rights Reserved
>>  #
>>  
>> +obj-$(CONFIG_DEBUG_UART_BOARD_INIT) += ../../st/stm32mp1/debug_uart.o
>> +
>>  obj-$(CONFIG_PMIC_STPMIC1) += ../../st/common/stpmic1.o
>>  obj-y += board.o
>>  
> 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
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
