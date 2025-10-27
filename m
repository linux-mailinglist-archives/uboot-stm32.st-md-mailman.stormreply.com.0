Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84958C0F8E4
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Oct 2025 18:12:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38A23C60492;
	Mon, 27 Oct 2025 17:12:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21A14C6048D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 17:12:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RG1Nq12188848; Mon, 27 Oct 2025 18:12:13 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013009.outbound.protection.outlook.com [40.107.159.9])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a22awawx8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 18:12:12 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9rhQjam+NBbRnGgC4OmBdnqyM5Bhcsas/cMXwvZJhX2E9b1teffhA9euCzxFvXh4dIjq69wWxSTHrx81I4PeETaJfmS58DGg8fdNmIL8f9/7pmvQTcfHJCzkUozCgXi1rVWdFVGnoFkDdXT9qTJ2hxR7EFcGZaGiI4mNoultKYoY6huPwZtBBYd/RvQcUgfmsrDqKUbsHB3S3TaMaeV83r+YltYavd38dFMc39nw0DS86/g0e6+GDR9N5i+Rw5dSwg6KYhJUgT0gvzVX4mLWtGr+jZ6udbTP3vsKojskneJ+Qj52iv+ouYvxpflmU3tplZXgg0nooIdpSqM7ojiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgh+t21nXbjYQg7pmlZx6hSd/d47ErXXdd1BzSI/SGk=;
 b=eUXxivOPaAJLmiy1TRMl2nx7xSvAdJujUo1OofT16Y3WMoqf/aFoVXvLHPErtats3IVnFxJkiTepnbZfWkLYxVpEM5cLGTZ50wpfM1ahsHwhvZgbrflUacrkk8QeoSLLq5LZp57lOohBOH59r4VN1fhGmNazzUAs4GXMqLtb91SaQRlysxZ5LkOlQe4yqB5+pNrdxoIxdPm++68OzRj3LWK+oR7DRFFbVGVP+7WWGcAdr2Medf0ys/am8fX1WQysVK3BCjNvLtqtdWTOsTICoomNj5U2tF3ABaUqmYzgp8ewRauJB1eNXX4YfgB+wHJNPYEyFPADpydJ2fjy8Uf5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgh+t21nXbjYQg7pmlZx6hSd/d47ErXXdd1BzSI/SGk=;
 b=Ft5j9osFcfM3Ed3npOt8w0W5TNZq/aXpud4xt3J8YKZak1iDdEWNreH0L4/2tdHRi3xFUPZxsrqJ0mY6op1AuswYZwlkEHQtXHACJvowwVM5ubaPi2O22bFKXmw6heIHROLn4WnXJL2FNKpfGqi9VfsolGdcZzndrP5FOZWf8iof31jZLqMsCsbSS42SW/aRl3qAdeeCZ9FpI/P20zbFFNFn33Xjmm5TXFqhIZLraov8SjBW3amHMzjj+tHRx+Tg0ZVEIQW2HFtJ2YHkrPAzb+1YgJtE0z1mRN2KLCsA1650exTISHDmlmOwItRBJ8fzzawY7jbJ2jKlDG30QAQQVA==
Received: from DUZPR01CA0199.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::28) by DB9PR10MB5980.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:39f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:12:09 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::b6) by DUZPR01CA0199.outlook.office365.com
 (2603:10a6:10:4b6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:12:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 17:12:08 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 18:09:54 +0100
Received: from [10.48.87.93] (10.48.87.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 18:12:07 +0100
Message-ID: <98964a94-9be5-493d-9d09-c1e9ba3ff250@foss.st.com>
Date: Mon, 27 Oct 2025 18:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251023214855.181410-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251023214855.181410-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|DB9PR10MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d59bf3-b993-49bc-0d79-08de157bf626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVRFalljRml6YU9HWnE5SHNWazlmdEVBUDBMdklibzdEZm4va2FXdE01Q0lP?=
 =?utf-8?B?NEtjSm8yQlNKNnJXZkVZQUVxVWVNQkxrZ2pGQjNYMG5hcTdlYzRJaXlmeUFw?=
 =?utf-8?B?aHZkL0xIR3J5cWh1cGFYckRXUEJYVG5JVHZBYnc0TjVyUHFpU0h6ODBVenFx?=
 =?utf-8?B?Wm5jUVhnV3VDYUhWRHdabDBPcU1OVGdnVlZlMzV3QVNjalVReGxySVYwSGlS?=
 =?utf-8?B?amdRaC8xMzRmYmJBREJ1T2Ewd0t6dkNCWVdIbGRaMXNEY1lzUTlWdWl3NGxP?=
 =?utf-8?B?eXJJYlNlRUNwb3pIZGczQUk1UXFkVnA0Y3RHTU9HMXExNXNWTmVqWHJYRWVp?=
 =?utf-8?B?RDZlUjdhaFpYVWVHNGRoYmxBbENNVzNLc1ZlV3NSU1dLaDJscUxrSEwxYzR3?=
 =?utf-8?B?cncxNHJmYTg3eVNLaFRpZW9scGxpdjFidmY5anFUNno0ZnB2UGhZSkJ6cVpi?=
 =?utf-8?B?TE5hSEhlVmF6M1NESGphbU1qQnNhdzd2cDd3MVZIdWZnYkNKckZIamErNkY5?=
 =?utf-8?B?UWUyMmhtQXdsL2owa2RxTDIxYXk2Y2hvWmppeVptVHRWVDFuWm55V0xVMEtO?=
 =?utf-8?B?NDlRNjJlVEJPTGpueGUxUDV5aktPTmpKd1NqQm9xdjl3cjN3NWNKMUlIb3Ur?=
 =?utf-8?B?VUZORFZ6YzYxSnc0a1J0SGxhTy8yUDJVd2NuTWdQNzMrQkx3d3RiZk9hZ3c4?=
 =?utf-8?B?ZGdHWTdiRzF6ZEtzZGhveFdvYSt6bENHSVhvUUtlOXRRRE1Vb3hkcEVLM21X?=
 =?utf-8?B?dXpDb3p5Ykxjb2tFMkp3dVloTTJrNm1hSmFWckxGeFU1YnNJYitjSjVuelNO?=
 =?utf-8?B?WE00Zlc2YmJpT3RueVdFeTRZNWEycmRZS2Juck1kL1NIMWtqTzcwUFo1UTBK?=
 =?utf-8?B?N2FmYlp4QUhIczhhWlExcUdIamFxa1YySUdhWTFVRWd3dUhHbkJwSkxucHlH?=
 =?utf-8?B?THFTKzlFQ0UwbDhRTGdQM21KME1kTlRoa1hheWVNUW9PRWhXVEoyMVJzZjl2?=
 =?utf-8?B?dzROTFkwZkJPUzVKVDVnSml5OG9ZdUREOXE4eTBBdEkvWW5aN3RnUVhDcGxs?=
 =?utf-8?B?YVdpWE1TTCtrVlBTZFpQdVpLcUYwQ0lCeGxleXdIRGFMdGsxSWVMeVQ2allw?=
 =?utf-8?B?R2FNa2l2b2NZRm4vbVVFTzhBZkd4djNvTFg5eGkvaHVuUXdEN3pRbWg5U2JV?=
 =?utf-8?B?OEp6U2NHekptMkZ0TW1hZHZwbE01dGJwRVBvZkU5NllDc3JzMWFkMTg2WXE3?=
 =?utf-8?B?WGxpN0l4RlJrMENOZjA1R3IvMmx6aDBOZVZab0EyOWhscUErSGpoRFdtcGxR?=
 =?utf-8?B?dmk2ZDBmZysyR09sWkhBb2NPOU83NndFNXFpK2llTDJvQktMRFMzN1FVU3Z5?=
 =?utf-8?B?NDBFVktlYlpZMDk0SVVFbHVXL0hLNHRWWjZsYloxSkE0UmpCOGI2aWVKRTNU?=
 =?utf-8?B?ZDY3OHpQMjFNQVczT3JwYUxJOXpFS2xyNndsRHRZWmxkRzlUemxiQk5uNEc2?=
 =?utf-8?B?YUVnc1o2Skl6T1dNYUdxNUlHOWJZbTdpeWdMQm5jQlFWQWJwUGlVL2d2cXNj?=
 =?utf-8?B?TC9mUFI1c254SW91S0VVRVRSOTZtZ0tLaEdrZVdxeHRXazUrc1J3RmxtdkFM?=
 =?utf-8?B?d1BMNnV1UG1kWHdxTC8yTDlsaXl0NVovR0NtYWVDS3RsdlU4cmlkWmxiKzJn?=
 =?utf-8?B?WjFiSDI1QnAwM3R4SmhLV1hTelZvWDU2SnpzTk5MdlZqYk9XVFczdE8zQjUv?=
 =?utf-8?B?VnM1cUZPdWRNWVh0Tm80U2htbkVlZGxOSWtIaWFia3k4eEpRb21XcVN4Yndp?=
 =?utf-8?B?MGVMNHdxQVJ0cklqZFREc3J4dm9jM3JGcVg2UFZOaktodnNrcHI2cERzbzha?=
 =?utf-8?B?cG0rMjZVUVBmRXZlSjJWTzRrK3BjT1YrZHlIaXZ3VVJNYkN0Ykg4dHllUEN5?=
 =?utf-8?B?WTJwZUhZQnl3K1lGR2RMUG4reERXNmFYblhqMG9SeEpiai9ncnRTeFBjK2tH?=
 =?utf-8?B?bGhseU5SbWlEWExvcUtLUnJxREc1YkhqMGd0d2hnOG54Wi9COVgrRFk0TVhP?=
 =?utf-8?B?Zi9nMThJUWpqZkxpdzVtd1JhYXdKYnNKbTBEK0J0Q3ZySXJzMG95VVdmZGJt?=
 =?utf-8?Q?zTPg=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:12:08.6623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d59bf3-b993-49bc-0d79-08de157bf626
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5980
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE1OSBTYWx0ZWRfX3mZttJZdk127
 jmLGfaW1a/eKfiIEphc7MAsy4wxN9DnzlPTUFDIJpPFX2ZZrsvqXC4BbRRELYIFWrVcX/uTjMi6
 WIw36SErTC0Kya4KfpGyjmSSkfJ1gGtLKNyTqBD/X6LYVUv+twydAN7NHF6zRrRJKEQmx88eAw2
 +J1Deiducd33O0/SZ8Jam5m2TthHXI0TpIKEMOUzibKCuXG8CdUaXKNBzGDmlZBjfpESu4kUluw
 v0USzp5zX11zU110He1OiMxWKoZwfy0+KPxy/dWG2jJLa6AUlpK904/xloFtYGJP7oKSHbBL4kD
 gMeGBzVVZUGQNkpVXtzBlBa+sCBQFxG0jxOlxzbKdQYhVDOnXK8BY7YfLwfeKhJ2e1OOtsL6WTg
 bjlDtCa5VdV5YWtqc7YwxLJAef9HAg==
X-Authority-Analysis: v=2.4 cv=T/KBjvKQ c=1 sm=1 tr=0 ts=68ffa7ec cx=c_pps
 a=59FDOJj/JSXgnzvZNwxhdg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=fNab4c-S0_lex60mRfYA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22 a=HhbK4dLum7pmb74im6QT:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-ORIG-GUID: i6DwW7WUb7EWDznJ5-G2JSR03Fkqk1Yn
X-Proofpoint-GUID: i6DwW7WUb7EWDznJ5-G2JSR03Fkqk1Yn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270159
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 1/3] board: dhelectronics: Move
 dh_add_item_number_and_serial_to_env() to common code
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



On 10/23/25 23:48, Marek Vasut wrote:
> Move dh_add_item_number_and_serial_to_env() to common code, so it
> can be used by both STM32MP13xx and iMX8MP DHSOM. No functional
> change.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  board/dhelectronics/common/dh_common.c        | 37 +++++++++++++++++++
>  board/dhelectronics/common/dh_common.h        |  9 +++++
>  .../dh_imx8mp/imx8mp_dhcom_pdk2.c             | 37 -------------------
>  3 files changed, 46 insertions(+), 37 deletions(-)
> 
> diff --git a/board/dhelectronics/common/dh_common.c b/board/dhelectronics/common/dh_common.c
> index 6101ecc7ebc..e7ee23aa8ce 100644
> --- a/board/dhelectronics/common/dh_common.c
> +++ b/board/dhelectronics/common/dh_common.c
> @@ -246,3 +246,40 @@ __weak int dh_setup_mac_address(struct eeprom_id_page *eip)
>  	printf("%s: Unable to set mac address!\n", __func__);
>  	return -ENXIO;
>  }
> +
> +void dh_add_item_number_and_serial_to_env(struct eeprom_id_page *eip)
> +{
> +	char *item_number_env;
> +	char item_number[8];	/* String with 7 characters + string termination */
> +	char *serial_env;
> +	char serial[10];	/* String with 9 characters + string termination */
> +	int ret;
> +
> +	ret = dh_get_value_from_eeprom_buffer(DH_ITEM_NUMBER, item_number, sizeof(item_number),
> +					      eip);
> +	if (ret) {
> +		printf("%s: Unable to get DHSOM item number from EEPROM ID page! ret = %d\n",
> +		       __func__, ret);
> +	} else {
> +		item_number_env = env_get("dh_som_item_number");
> +		if (!item_number_env)
> +			env_set("dh_som_item_number", item_number);
> +		else if (strcmp(item_number_env, item_number))
> +			printf("Warning: Environment dh_som_item_number differs from EEPROM ID page value (%s != %s)\n",
> +			       item_number_env, item_number);
> +	}
> +
> +	ret = dh_get_value_from_eeprom_buffer(DH_SERIAL_NUMBER, serial, sizeof(serial),
> +					      eip);
> +	if (ret) {
> +		printf("%s: Unable to get DHSOM serial number from EEPROM ID page! ret = %d\n",
> +		       __func__, ret);
> +	} else {
> +		serial_env = env_get("dh_som_serial_number");
> +		if (!serial_env)
> +			env_set("dh_som_serial_number", serial);
> +		else if (strcmp(serial_env, serial))
> +			printf("Warning: Environment dh_som_serial_number differs from EEPROM ID page value (%s != %s)\n",
> +			       serial_env, serial);
> +	}
> +}
> diff --git a/board/dhelectronics/common/dh_common.h b/board/dhelectronics/common/dh_common.h
> index c4693c60618..b4f31bdb88e 100644
> --- a/board/dhelectronics/common/dh_common.h
> +++ b/board/dhelectronics/common/dh_common.h
> @@ -107,7 +107,16 @@ int dh_get_value_from_eeprom_buffer(enum eip_request_values request, u8 *data, i
>  
>  /*
>   * dh_setup_mac_address - Try to get MAC address from various locations and write it to env
> + * @eip: ID EEPROM buffer
>   *
>   * Return: 0 if OK, other value on error
>   */
>  int dh_setup_mac_address(struct eeprom_id_page *eip);
> +
> +/*
> + * dh_add_item_number_and_serial_to_env - Try to get DH IDs from WLP write them to env
> + * @eip: ID EEPROM buffer
> + *
> + * Return: 0 if OK, other value on error
> + */
> +void dh_add_item_number_and_serial_to_env(struct eeprom_id_page *eip);
> diff --git a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
> index 3a890c5920c..5c35a5bf447 100644
> --- a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
> +++ b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
> @@ -116,43 +116,6 @@ int dh_setup_mac_address(struct eeprom_id_page *eip)
>  	return ret;
>  }
>  
> -void dh_add_item_number_and_serial_to_env(struct eeprom_id_page *eip)
> -{
> -	char *item_number_env;
> -	char item_number[8];	/* String with 7 characters + string termination */
> -	char *serial_env;
> -	char serial[10];	/* String with 9 characters + string termination */
> -	int ret;
> -
> -	ret = dh_get_value_from_eeprom_buffer(DH_ITEM_NUMBER, item_number, sizeof(item_number),
> -					      eip);
> -	if (ret) {
> -		printf("%s: Unable to get DHSOM item number from EEPROM ID page! ret = %d\n",
> -		       __func__, ret);
> -	} else {
> -		item_number_env = env_get("dh_som_item_number");
> -		if (!item_number_env)
> -			env_set("dh_som_item_number", item_number);
> -		else if (strcmp(item_number_env, item_number))
> -			printf("Warning: Environment dh_som_item_number differs from EEPROM ID page value (%s != %s)\n",
> -			       item_number_env, item_number);
> -	}
> -
> -	ret = dh_get_value_from_eeprom_buffer(DH_SERIAL_NUMBER, serial, sizeof(serial),
> -					      eip);
> -	if (ret) {
> -		printf("%s: Unable to get DHSOM serial number from EEPROM ID page! ret = %d\n",
> -		       __func__, ret);
> -	} else {
> -		serial_env = env_get("dh_som_serial_number");
> -		if (!serial_env)
> -			env_set("dh_som_serial_number", serial);
> -		else if (strcmp(serial_env, serial))
> -			printf("Warning: Environment dh_som_serial_number differs from EEPROM ID page value (%s != %s)\n",
> -			       serial_env, serial);
> -	}
> -}
> -
>  int board_late_init(void)
>  {
>  	u8 eeprom_buffer[DH_EEPROM_ID_PAGE_MAX_SIZE] = { 0 };
Hi 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
