Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D25C652F7
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Nov 2025 17:37:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1C32C628DE;
	Mon, 17 Nov 2025 16:37:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EE0FC5C842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 16:37:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHGTN3n1695375; Mon, 17 Nov 2025 17:36:42 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4ag6nw85r4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 17 Nov 2025 17:36:42 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tN9b89LR7uEatFUJZ0x2JhwFYrL4Re+bp+zJ2aOSQIKBSEN71gxrUR4JRjq40hKMNYmhqgL/S8tDX343S0d5CSkf71eZ0Ijq4NT2xBdGLp2G5eIYG4YUzmM0f8Xbl5NNwrYnw5O+FsOA5CIjAZzpI/jYqSS9p0vaRKELBtbzP/NOaEpxZ/dE7PD05u+JOpADAk74Ju3Cs5EQzQJBONagbSIdzn6shDXyD/7eiqlnQaKUCf/Acmv7kyt0dP5xUHKIYxAygfhI2hWJexrhf1+5NWMbJF1oXrwA3IY6Nb+akwjMpG0+0ux94S0GL6uoobNDdSAiWpnJsG3PnPGT1MDEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucd8qXGOO2Kd+JLNv2l1GLyfj8D+4UzZLyhuGckBxHs=;
 b=Ezn7yiHIWd8AkB+D82Ofi6g5YSHPAir6IP7SMR1eY6k2rP/5lQx91tvRrbh/EQIlB9i55e+Q/qIBscGWyIGyio1WvsgaYOHzT9MUCPzbIjCNPCgsJEGAZ3ZAf7/TH6Dv4364WS6D6a5zqbz3q3IA+Kdtkv5ZtY7Lf+H0eOk5UnXpLbonBJe3BwwgJdd8pREWMGJX8MZhIhIP6oXHP2GXcHaeLlITSvdIjmminaZzJzUUD5SeecgGuE+xO5GDx2Wah7+9oHr+gUnqSVb5QNfiQOLKTKrdWjA1tQzytOIWkVLF0cSsXLdoiviN2V6VFf/ygGYjX+K04t3jJ6wOx6KRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucd8qXGOO2Kd+JLNv2l1GLyfj8D+4UzZLyhuGckBxHs=;
 b=eodyUWsw3ectxPxkpyPobuZWNYeN5VRXQR0zk5XS3Fcuxm+9LsbViQrY01x0SRusHkKS2royRN5yDFNoDB09BJCanbihZa+Uz4KSFCurq2rolWxYzGLT0P+qjX1dGgGi3zbnz5VmtlXBgit4DG33u4K72FHzeubN6S3nsRiBqwDe1ivvSfGffG8tbJnfx44JnnXiAih0S5WR+i5jPz8DhsfraHEs4Wnj0tWMpD7FBw72kj1b3tkottT4MgbG8/yhXwJFxb3EtH7fAY3the/MxMtEE8EITP8kFeXowruj8DLiG1H3EEPuRPDDRuVWc8Z5RrPVUuUyexqqmHatTnr8uA==
Received: from CWLP123CA0142.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:87::34)
 by PA2PR10MB8338.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:415::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 16:36:38 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:401:87:cafe::30) by CWLP123CA0142.outlook.office365.com
 (2603:10a6:401:87::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 16:36:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 16:36:37 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 17:37:01 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 17:36:36 +0100
Message-ID: <71047e69-164e-4c65-9eb7-587de4f147ff@foss.st.com>
Date: Mon, 17 Nov 2025 17:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
 <20251114154259.4035206-3-patrice.chotard@foss.st.com>
 <4a71038b-ce5b-4119-9493-4e33642a8528@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <4a71038b-ce5b-4119-9493-4e33642a8528@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000043:EE_|PA2PR10MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e30fff1-c13a-4f3e-6712-08de25f77ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azYzdVhPeVhWK2xMK0hUekV1UEpvMFpxanFNZGxDSThWRytYK3p0b3FPSkxo?=
 =?utf-8?B?UU9xd1IyYWc1Z1pTc2dNMTQ2eEdGN3M1bEVIMjcvT3N1Q2tzOThMR3dva1dC?=
 =?utf-8?B?OXJGVGxMMEFZaE1najdGbkJGNFFtVU5VN3U3d1VnQllEU0ZncGNkL01FVzBB?=
 =?utf-8?B?ZnZwQ2kyN3RickJpbzQ2WURBY1hUejlJdU1xQmZCS1ZiYWRDcjF6ZmZjMXFl?=
 =?utf-8?B?cnRJUnJ1VHFzQzRMTmJISnU3UWYwMWJxd1ZMcUZmOWVpbGZtR3VRUS9WUDlG?=
 =?utf-8?B?cHpYbWF3R1RZZ0xTVnZ2bUFJdEVWOWFhTGQ5eGpTMkpUUmp1V2QvNXh4YXZH?=
 =?utf-8?B?KzVDVDhiV0RtT2J3Zk16VDYzZ0F3WGh4NVFZeHQ4dmlNdzJVVElKMzVuWGQ2?=
 =?utf-8?B?azNKUXhqeTVTRzRENm1iT3lzN3BrQUxNeU1LZjBHQVgzS2Njc01zY1p1anhY?=
 =?utf-8?B?TDYrYXNZL0wwM3FxQzhORjlkc2o2a3Ird29PZzdVaElTTzZpZkNEOGtSY2w2?=
 =?utf-8?B?eENtZ2ZIcXBtQjIwTlkyeWg5WDBGK1dQbGNndHIzVkM4TDN0clFHcFczYWZR?=
 =?utf-8?B?dFF0SGc5YzJ0dnFZY09xYytiRWo2d0pyYVZDRkpDczlPZmxsQTJSZ0FHMmxz?=
 =?utf-8?B?ZDdsZTFoV1VuZ01SOGUyZ296dHY2eXFBWDVVOUpOcXVzZW43eGRSc1JWaXlB?=
 =?utf-8?B?TysrMUhBcVhQdjB2MTEzTXN4MmRtbEQ3akZEdDBhVmNPQytlU2pBbGRINmc5?=
 =?utf-8?B?RVpWQmoxdlBmYW84QjlSSWY3R1RIdGlVRU5xRzhVYktLZzVXM21zbTZmUUM5?=
 =?utf-8?B?cklsNWE3YXN6cklIMXN0U3lCWHBjN3NZaEdzblFyWU9NazZkejc0NVhqM0Z3?=
 =?utf-8?B?Z0NDY0pLaE5VVjRzcFpnZG9iN2k2dzRJdUhmT0dnNzFaT0RMQUt1UjRxRGFu?=
 =?utf-8?B?WnVObWQrQW9FcXlKUWtOTUoya3lMaDhXMEs5QWNUMkFleHhFbnFRM1ZVQkJP?=
 =?utf-8?B?UUxmWmJJbFpnc2srWXR0RlFSenJERWJkRXRGMVllN2J6TGYySm9yR2owRTdQ?=
 =?utf-8?B?SWxIRnBSUDJHMWRIakc4QldBREhWRHdZTjlYMis3SVEvL3VhTDJxUHdGUm5v?=
 =?utf-8?B?YktNS3JheUZTU1U3OEtNSnN4TE5nRXc3M1VPdm84b0dEN1czcVltR1l5OE5Q?=
 =?utf-8?B?NW5oaUUrWVRTVVlpYm1NOHRSR3FoS1VUaCs1cWJHeUtOQjQ0bkhjZ3dDVUdR?=
 =?utf-8?B?Q3E4Z1l2WHphRmNieFFYTkNFNmZNdE1OaU9OaFhaY0pUem1DOVg2dVVNTGhS?=
 =?utf-8?B?SmVoMFpoeUxGaU44Y1JqbDh5ZytHdjhhT01pQUhmWmMzeE1GQ0ZhNE8yWE9M?=
 =?utf-8?B?WGl2bVgrS0xRaGdRUzJ0ZHdsYVNjYnpYQmRlRnFBSGhEQ090bzR6bTZoRy9K?=
 =?utf-8?B?eEE4bFlFNHRRVjZ4eVhPaGVWRGZ0NDNGbVhUTE83R2gxd1pUanVTOHBmalU2?=
 =?utf-8?B?VlVMTzNVNFRNbDBBZnJUU25uNDl4aVc0S2lNOGlkWDErQU4xUU9lSURoNkVx?=
 =?utf-8?B?NWlNRkEzOGRhNmdqWGovWTgxL2t4RWJiNytwb2hHRVdzYXlPWUNxWFA3Ujlp?=
 =?utf-8?B?R1EwYzRlaXhCZ1RTMDVBeldJUTVzcW5ESUtROG1sMmlMMVAvZ2tLSUNrc2J3?=
 =?utf-8?B?K2U4TEZTaEhlWm1kRzVtcGxrRjlsUnhtc1llT0RlcWs1dUdZK1E2dVQxOVpC?=
 =?utf-8?B?Si80L1J2WmZKaHh0YUJQSVdhTlZpTldsVjVNOXZ5ZWpQNXBKYmtMMm9EUHRj?=
 =?utf-8?B?cXQycW1hRnZRdFpBbkJNRGhZTnBjWVRuOUVkMlRlMUFOUkIvT0tPRWh6MFpa?=
 =?utf-8?B?WjlhSkJTYTVvUytxVkpXQUhxekcrU25JYnhwREs3YmwrYURoT2s1ZmhtRzRj?=
 =?utf-8?B?WSsrT0NuTWhUblN6S21DZnF2VGl2bmpHdTU2cXkyd29pTzZNcVU3cnRGc1Bh?=
 =?utf-8?B?QWZDRTd2eU9MUWhYRktXYnllWW9POVZWUGRZWTdNV200UGZxSFAzTFd1bW02?=
 =?utf-8?B?ZzQ4bElsNmhMVi9BaUg0eXJoUXkvWVNSU3FSUDFadENqUHJQNDIwcmp6Y3Uw?=
 =?utf-8?Q?TOiI=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 16:36:37.9136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e30fff1-c13a-4f3e-6712-08de25f77ac2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8338
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE0MCBTYWx0ZWRfXyFTyRbH1CjFg
 khnWTed6P9nwv6s2O2HPrUrsf/Ux3fCApCPycXjo7BhAIREIcYLPCMcoDFPp3jbOy4X72GjMv4M
 5Bv+VbN/NXx5hrFID6W0eeeg0d6vrryfnYNPOeafQxabzzAqrxNLzkZsi/TH6nCF2/LEiB/XKXA
 rDET0ZDw14Zt5FdDsPcQgpYSWqPveSL6jzyXM2+J1oMh5zSh8OA3NvUIdEF6WDx+oAKMWJ0j+Wo
 MJCNaDz8gobAvjzwAO82tcZjpBIkwMbz5FD3VtdSpAb0Y8Kt98Vc6R5AfHA/ISPGWXzFR9QRG1g
 WcgqOP7Yr2k8U7G5LKbP1RUcO73tpf3BaRYlcWF7L3FkRLoa8pijDPorGbXc5Py0AxGTuTIWXZT
 CRjf16rDC5cA4GpLeg3o7ntOMaLtkw==
X-Authority-Analysis: v=2.4 cv=WPVyn3sR c=1 sm=1 tr=0 ts=691b4f1a cx=c_pps
 a=Kb+jYgIXhKC87qzND7NMaw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3CZomJY1uvxBjMX92_AA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 9t_p8rb072bkwT0uPpZDzJ437_lEVtgX
X-Proofpoint-ORIG-GUID: 9t_p8rb072bkwT0uPpZDzJ437_lEVtgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170140
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Valentin
 Caron <valentin.caron@foss.st.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Vinh Nguyen <vinh.nguyen.xz@renesas.com>, Alice Guo <alice.guo@nxp.com>,
 Kamlesh Gurudasani <kamlesh@ti.com>,
 Casey Connolly <casey.connolly@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: [Uboot-stm32] [PATCH 2/6] clk: scmi: Force call of
 scmi_clk_get_attribute() during probe
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



On 11/15/25 00:08, Marek Vasut wrote:
> On 11/14/25 4:41 PM, Patrice Chotard wrote:
>> Since commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution"),
>> all clocks which are parent clocks are name "scmi-%zu" which
>> leads to error during their children clocks registration.
>>
>> In order to not cancel boot time optimization done in
>> commit 3547e315c188 ("clk: scmi: Defer issue of SCMI_CLOCK_ATTRIBUTES"),
>> choice has been done to re-introduce scmi_clk_get_attribute() call
>> during scmi_clk_probe() under new CLK_SCMI_FORCE_ATTRIBUTE flag.
>>
>> This restores boot on stm32mp13 and stm32mp2 family boards.
>>
>> Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
> SCMI spec says that clock IDs have to be monotonic and incrementing, without gaps . This driver registers all SCMI clock for you exactly this way. What exactly is the problem on STM32 ? Are you maybe missing some reparenting somewhere else ? Maybe the clock parent resolution should happen when the clock are first used, just like attributes are now resolved when the clock are first used ?

Hi Marek

Initially, on STM32 we first registered SCMI clocks with their real names and then we registered all RCC clocks 
in stm32_rcc_init(). For most of these latter clocks, their parent are SCMI clocks.

After commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution"), the name of these SCMI "parent" clocks
becames "scmi-%zu" which makes clk_register() failed as we still try to register RCC clocks using their parent's "real names".

For example: for STM32MP13, clock "ck_hse" becames "scmi-0", so all clocks which are "ck_hse"'s child can't be registered.

Patrice> 
> This kind of a workaround with Kconfig symbol is not the right solution.


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
