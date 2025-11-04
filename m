Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B639C3069F
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 11:06:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECDC7C62ED6;
	Tue,  4 Nov 2025 10:06:27 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D017EC030AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 10:06:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1kEZjy7Ny64h/VaRdXvRAS+B8Ww950X7YVy6aGysfU4tq9kH198T6SAfQY8Yr8aY1dBnrpigDRd3VsLXVsRpGzdElmT6WLZHJGYKbN5coALrxeMB43w/NebeQl4yodHh0KwlJP7px6d33xqnlbK8RsFGYwIr5dbjsDgi3eD3fgziEyo/QX9YWHvAM88ezkU1TaWO/tTVgQ3dwrTU0RrN/LJ0RtZs4sjnCXnlbOXCNrXXu0Mui2pb/0a6FViL8PAzOumL5MybR3EriNEqKffe+RlN5xlet6Yh6NoODbSG72iyNjaEc3SIZohs7ap1qcL94XB+n+MR/HmDlXTmXQ0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akydaDcKqEDh5K3k1TK2h2d4Gv0UuVZz7QZbnToxwxQ=;
 b=cP1lOYfDtDIkVAw+3kMMQMaVyYLEkuzDoUr2T/Qz0ncXKf7viKLboqHJfyn7dCOdQcYyaFD6It+X0HQUmsszcHXkHZNyEgR31ZO8fq0o3RAnIi2R+YkDv8Dew98IxVEbgN/eXrWri/1X57GHy8QVloP41MKQlyRX5XBtUO+KqBmEhBy5QHNlbgjmSmzTm8WxulXpn3IZVWW848GtX9uFwsbDsYaXZNVyy0bnCvXlN5ldXv52m8XMSem7gOX62tAUHMcNf6cBGpM/ESoSX4pUBKtWuDju570wiM3ECwlF09kmL50MilaKJTMrlpO0hC43di5R2j2nHy/ZcBSQWuKsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akydaDcKqEDh5K3k1TK2h2d4Gv0UuVZz7QZbnToxwxQ=;
 b=iPJ+dXU3PHKtQnVUlRflgcdkn6Y12niquniPZGaf5Z6s7B/lZj8dCyJFemg5atpz9d7yZfo8vwr0lHOVg7zY+0osaewKGSBQDE16B1kn1J0r6bbtQbod8ZYj80AejFo2Xr77OTHMCo1z7QEMcXSLFMS0uT9jRVCc9y0Tgi40aNQuJ5L2Os+eeQpvIBgwGtNy9HZB6hNnEI6GAqCB51opC/O5yFZhIs9hhaABkDfLHdZazSVQQl5IvPL3NzjdMDiNVxW99Xzx2XtVPV9IpPBCpwmmYEBPvoeF/XafgCPVzc/omUKrnhGQNFvh+K7LfHvhaWT7IFv2vgCmem1R6F+cOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB9969.eurprd04.prod.outlook.com (2603:10a6:20b:67c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 10:06:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 10:06:25 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 04 Nov 2025 18:05:51 +0800
Message-Id: <20251104-imx-rproc-v4-v4-2-8bbc7b886737@nxp.com>
References: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
In-Reply-To: <20251104-imx-rproc-v4-v4-0-8bbc7b886737@nxp.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Stefano Babic <sbabic@nabladev.com>, Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762250765; l=10463;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=w58RuJ1ehcajqvHSguwWr2CVoTDwR7G1Y3b1nUlur7g=;
 b=3t9ZoSJFseRRiuyah1H2AdUJwcWbJUkUeORcILPuLY3jqvc+eTAsiLRvwW18Qr9YCBNCCu9nr
 q9Tcnj+GW9cDuGEl/1vb6Zy+pisDpao4j0t0FsbNb+10wRDpXYdBWxZ
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b16010-0107-4e9b-4014-08de1b89d051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnVqR0dUS1lESi9ESElHTSs4dUM4ejNjbzM0R2ZtRXlUc20wdW5uNnFGQkQ0?=
 =?utf-8?B?Mi9wYXNvejJzK1F5WmRtTklWbWZ0WXIwb1FqcHFIVXo3NktHZE5hRUcvWmVO?=
 =?utf-8?B?VGFRK21icE9CV1JLTmd2OEprSzZCNlZkaWM1UkRmUVhhQXprUGNycm8rVDZx?=
 =?utf-8?B?NUNhd1ZzUVFlMUt1cnBESVZDQXc4WGFYeno3S1VwSzZ5by80K3NuWi82Qkkw?=
 =?utf-8?B?YUlkaVRNZTZvWUVTbzU4N2RaeXZoY1l4WjRZcWYwekkrVXJaMVFxVlR6SVla?=
 =?utf-8?B?K3V0TUtXSFI0aTMrcDZzcU5yY295dERUdFhFODFUQ3ExVlB2R1I2ZzNXVFlo?=
 =?utf-8?B?YU45MThmMzNwb3RBa3J6SHcxWDJDc0VYSXF5dG9zZkZJcUp0a0cvaEVWTG1j?=
 =?utf-8?B?WTQ4NjFCNC9HUzd6S05LeVA1VjZwOGozdG9RdVFGQStsZHFsbHRubWphWHlN?=
 =?utf-8?B?bU90c0FqY2dLWFNOVHdtdDcwNHpXekVzN2QyUEpiNTJGbEphNmV5bHdoN3Zx?=
 =?utf-8?B?MHNFOVA1YXRqRmRvS3cxbjlTMjFZcFNXeHRDY1o0cS9saGxCSW9PMnJNb3Nj?=
 =?utf-8?B?ZFJVSXo0MERacXhyS2lOUFBib0RIN3BWYTUvdTJSMmFjUWdQYWVtVHo3bVg5?=
 =?utf-8?B?SzNlSElCUmlCaUhVZDJYTG1QbWY0M3N1OHhENWxRMGx0Z0lpQnRmL2JFQUxi?=
 =?utf-8?B?TDVwWXd5eExvTkU1S0ExcVNTcnRWQVRwNnpiMzFmd0FOMDVZaVFRRmVSNEt5?=
 =?utf-8?B?cXhpRlMxM1JMVzcvWDZIdk42S0l5MUk0bE1RV0lzUksrMHg1RW1IZzg3V0ov?=
 =?utf-8?B?ak1pYm51UWFCWDMxakJicHRzLzUrV2hNT3NCcU5USlVhaDg2bS9lUVJvQ3BL?=
 =?utf-8?B?SHRwZVNVelY4ZmFWcnplRTNHTkMxdTRTOVNOOEM1R2d2TVVNL0htZVJqSGQr?=
 =?utf-8?B?dE43RGJYUUhmazNXNGVDdjNpeXZGbFlQMS9Nc2FnZnQyVVZoYkN6dUF4RzBm?=
 =?utf-8?B?eDE0MldnQmZYUlhQbkdvT1hZZmx1bTc4OXRsSkNMV1hZZm41akRRbWhEclh4?=
 =?utf-8?B?NzhBdkR0QlB6MnNtUHNoRmpnTkxhUmtFOGNGMmNsaXd5ZGNybkFpL0tkUWQ2?=
 =?utf-8?B?TXB1OUk2a2kvc1ExUWowS1UwUFNyVXFSZS9rSmlKdis0d3BWTi9BOGFsWWdz?=
 =?utf-8?B?RmYwUHF5cWVFWkV3VThCL3RXQ3JpbjVrTFMxMG12eFZ4dWhaRlZrMEk0a0xX?=
 =?utf-8?B?REdvQUJqRDNLTUlQME9yVXlLMGdGN2hKeUFGUmhBSlRlaCtWT3hhOWNEZGtv?=
 =?utf-8?B?eWExZFV1V2xjU29KNTI2dFltVGdNQ2RjMjdObGlqeFh4VmpYUmFrMnh5VzAv?=
 =?utf-8?B?L1JVS2t6WENTODU4NzZZOTEwZmVVVUI2eGVQOVRLbUtJUUVxUlpucjE5eGwr?=
 =?utf-8?B?SnVSZCs3T0JEREJDUXVvdEY1SmRCc0ZmYnNTR2JGV2FLTUN4S21wanpXWWFv?=
 =?utf-8?B?dUttSEp4RS9XYmJnUmc0NHdXYklFR3B4bGEzQS9oUmNXRHhGdFRjL3g3YmVu?=
 =?utf-8?B?ZTd1OTJtSjVpYTFmKzdLM0tKRWVTbkw4bDBPQmQ0Z1drdHdCSTVkMlAweTM4?=
 =?utf-8?B?eUF4eFdzS0xJZXNrZGNRQUhjdkY5UEJkRHYwMWRmYkVjT1UrQjRiWTJQWlBF?=
 =?utf-8?B?OGJ6bHVHNEs1cXYrN0J1aEQrNURqdldpeURwalV5THdHdk44eUdOQXpEY1lJ?=
 =?utf-8?B?b0x2b1RhN0dhNitvTCt0M0p3bDlLbFB5dXNUSml4N0g3bVB2eE1UdmhVU2NK?=
 =?utf-8?B?MFMrNnNnZjZienkwSXBRSGJ2bjdkY0NvT0cxajZNam13SVhJQWdSdWNvbXFl?=
 =?utf-8?B?SGVkeVpqM3VzTGVTYkJncW9YbFREaTNMQytFVmpTRDFEb3ptSjBzeW1kWVE2?=
 =?utf-8?B?L21pUnFBMUNSQlpYVzZ5NlVqdVdDd0duQ3NxTkJWSjd3U293M1l5OHEwQXV0?=
 =?utf-8?B?emtmMWZUTzgxeG9VNlQwNmZxV2JBbU9vK1p0ZDFxSkdRcUl3cDFhdXkxSC9M?=
 =?utf-8?Q?xXJQo1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXFzN3NTM2kwYWN1a0FlZW1BTm1tWXkxWWh6ZUFjZFd6eHcvSFViNFliWFdh?=
 =?utf-8?B?MTIwMkUwVC9Fa3NHRzdPeDR6TDV0aldaSGdidmdPNEtqNmJaVWxWU3ZmcjVK?=
 =?utf-8?B?Tk10ZHpkMU5weXc4akJpZVBNckhFSjFGSEw0dUJtTjNNM0RiREgvdVN5Znkz?=
 =?utf-8?B?ZkZFcklJWmFncDJ1M2l4TUg3ZVZRcnhNcE0vaWdKcG1mdm9FREdMVmEwK2Q1?=
 =?utf-8?B?T2JldERXWlNkVi96Zk84TlN2OHQ3U2k3MXZzNVUrVjZDeW9DNm5rR0lnbzAx?=
 =?utf-8?B?a2lPblhBN0dDbEV3eGY2MjgzK3c0L2UxelZScXoxWnM3QnBUMmZyVDlXbFIw?=
 =?utf-8?B?OVM0SHBxa2E5b2dGczRDWVdQTDVIUEg0c3ZhYi9hQ2Q5YlNCU0p3RVNLbVoz?=
 =?utf-8?B?cVZXQjB6Zmo2cGZMVk5vcTJiUm9LSkJ1YlZ1TzJPTFc1d0ZvVnZjY0tld1VW?=
 =?utf-8?B?OCtBWk8vVm16aXM5NC9JaHRudXptOUZpQkoxTEhMMytYUkhsd2lHOW4yaU10?=
 =?utf-8?B?T1l1VGFuOFJ3RThBczN6Rkt5L0ZHYXpJdzlRL1VVOUJ3enpFUWVWc1dlS0Y1?=
 =?utf-8?B?eDZEZHBNeVpYVHEzSDFQOUg1U2Y3ME1lcG5nZE1UbjV6bURRd3J1R1NnSktq?=
 =?utf-8?B?dE04cTFIcVRMaDlKSFhrYmxCR2dTbzBhb2tQVmxaNXNIQW5GRDlHUmJpaEhJ?=
 =?utf-8?B?VzgyOFltK2VydWNxOTVDbncrVTNtbnRTU2ExY2JMaXlsdEZVdUk5QlEva2ZV?=
 =?utf-8?B?TFpLZE12ZEx1d0lGY1BCdGdVanFmSEhHbHU3RVB5Q29TdXJEVlJHeVpRK0NL?=
 =?utf-8?B?dS9HRlNLR0Q1UVRtL1BWQUl5cHlDMUphcnVzQW5XOEV0QmhMRWdoY3hJYXZv?=
 =?utf-8?B?MmJiL3Nrd0s3c21zSW5LN0dpQmR6NXVHZHViQXhwZmdycjBLV2J2NHlUdTdE?=
 =?utf-8?B?RDlKcWxaSFlxVXJUaFUxLzYzMnJqek9HR2Q5bXduRU9HSmZVTjY4T05aMzVE?=
 =?utf-8?B?Q3Z5ajNFZjNrSjBCV09Db0dOeWRIenY0WW5NWGpmckl0NGpNMFd2U0VVNTVH?=
 =?utf-8?B?ZzBzOXpWSkloYm4vNjAvTjdYdzRsQWNyQlpTMEhDZnB3cWtONk9CQVpGOUZP?=
 =?utf-8?B?V0VqOUh1amNud2lmdStJRUlVcnMvYWdiaHlnaWxkaEp5U1RoalZ5WTB0K1dj?=
 =?utf-8?B?MnkvN0RNZzN5bkQ2dVluTENpdXY4WXdOaVlBNUc1b1MzVTFaeUYwRTYrc0pV?=
 =?utf-8?B?bXRxRThJNTNDR3hkZHB0MmprTVdVVHdtL3hjK0ttU0plZlV6Ui9MclFuZDN6?=
 =?utf-8?B?YjZTY1Q2blFPck1FNEU3UWx5bDJ5YjRyaEllTGcvY2VDUXJ4ekM2YTlZRm43?=
 =?utf-8?B?M2daS0xPUzNTRjNvNzh1VmhIc3ZNWEVYNEtkV3ROTEJXY3d1bGxtQ2FQL1dV?=
 =?utf-8?B?b2srdGdydDQ5YWtRNW1ka3l2SStNeTNiSWZpbUloS29XblBjLzU1RXl1c1Jr?=
 =?utf-8?B?elAwR0lLTGs1S0VmZ0t4b0tsZ0FTc3lzeTFaRmRMU2hQVWd4STViRFAwZ05p?=
 =?utf-8?B?TVR1MkhvbUNSRzN1T3ZYK3Vjc1JVS3Z6Z2ZvSjM5ZWJiNUlyejZxQUxiMFNj?=
 =?utf-8?B?dlNqSnAydk0zSWp4c0VqaUFlYXJOS2tWZlNYdW5CU3B3LzBUVmt0aFVQR1Nh?=
 =?utf-8?B?WHZYWG9vaERKTG44MXdmdkorZTE0dGYrRkZrd3FlR25JM3dpdXZXTWU1LzJp?=
 =?utf-8?B?R3BPbTF6eTg4cnpSU0F0YXA1U1puN3JGZEdEVE5xMm1EOG9pUkFIVmJZS2d3?=
 =?utf-8?B?c0l0a0tkc1luNkR6UE9remNkNkZFTXc1SnRBMjZLa2wrc0V6VmZwWmdIMS9z?=
 =?utf-8?B?d1V3bzNYTHhBSGZkQ3MydlozUllaMFl0KzNTZnV1dFZnSUZ0am8yelhoNFl6?=
 =?utf-8?B?cGFLYnJmQzhlMTg5VFZHa1JSZlRWVHFQM0VrdWpvTzIzL3dkaFhSS3B5WjE5?=
 =?utf-8?B?bGxiZitSTktySU9ONHlWaGVZdmVmTTVlRFQwSkxtSjUxQXpyY2M0aW1WQWQr?=
 =?utf-8?B?WUgwd0xJSzBoVFBlU0NFeld6L2tsa015MGdDMzRJK0FRaFdUUkw1OWJ0Rmdm?=
 =?utf-8?Q?LTmxBiMAZWF+sf4mbaExvH0Zo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b16010-0107-4e9b-4014-08de1b89d051
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:06:25.3930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeM3lXkxfL3Fo6ZMdoxxcHpCv6CYbGJvhkyvAsW5DFtzeMupdClkPMDLVJ0WIYjXBfVrp4PBw9PMb9O5m8n/Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9969
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v4 02/12] remoteproc: Add imx_rproc driver to
 support NXP i.MX8MP/N
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

Support i.MX8MP/N with start/stop/device_to_virt/is_running/load
implemented. The device static configuration is mostly reused from
Linux Kernel with adapation to U-Boot dm_rproc_ops.
The booting method:
 - load mmc 2:2 0x90000000 /lib/firmware/imx8mp_m7_DDR_rpmsg_lite_str_echo_
   rtos.elf
 - rproc load 0 0x90000000 ${filesize}
 - rproc start 0

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS                    |   1 +
 drivers/remoteproc/Kconfig     |   7 ++
 drivers/remoteproc/Makefile    |   1 +
 drivers/remoteproc/imx_rproc.c | 233 +++++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.h |  56 ++++++++++
 5 files changed, 298 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c7d0e0ab2f63bbba74c3edd2435fb3b9603e3fe..818a2d74fbad60f0425e3cebc24b6029c2623141 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -319,6 +319,7 @@ F:	board/freescale/common/
 F:	common/spl/spl_imx_container.c
 F:	doc/imx/
 F:	drivers/mailbox/imx-mailbox.c
+F:	drivers/remoteproc/imx*
 F:	drivers/serial/serial_mxc.c
 F:	include/imx_container.h
 
diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index e9f19a694332bf255c0144467264193873dd6384..8056f210abc895ee0e4866679090cc47cce9e7ae 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -33,6 +33,13 @@ config REMOTEPROC_ADI_SC5XX
 	  Say 'y' here to add support for loading code onto SHARC cores in
 	  an ADSP-SC5xx SoC from Analog Devices
 
+config REMOTEPROC_IMX
+	bool "Support for NXP i.MX remoteproc"
+	select REMOTEPROC
+	depends on DM && MACH_IMX && OF_CONTROL
+	help
+	  Say 'y' here to add support for i.MX remoteproc.
+
 config REMOTEPROC_RENESAS_APMU
 	bool "Support for Renesas R-Car Gen4 APMU start of CR52 processor"
 	select REMOTEPROC
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 47bd57c7890d9b14cc53da59616ed59ea2eba47b..7ea8023c50bb8ca34cd142260a9cafa8040c5560 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_$(PHASE_)REMOTEPROC) += rproc-uclass.o rproc-elf-loader.o
 # Remote proc drivers - Please keep this list alphabetically sorted.
 obj-$(CONFIG_K3_SYSTEM_CONTROLLER) += k3_system_controller.o
 obj-$(CONFIG_REMOTEPROC_ADI_SC5XX) += adi_sc5xx_rproc.o
+obj-$(CONFIG_REMOTEPROC_IMX) += imx_rproc.o
 obj-$(CONFIG_REMOTEPROC_RENESAS_APMU) += renesas_apmu.o
 obj-$(CONFIG_REMOTEPROC_SANDBOX) += sandbox_testproc.o
 obj-$(CONFIG_REMOTEPROC_STM32_COPRO) += stm32_copro.o
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
new file mode 100644
index 0000000000000000000000000000000000000000..1b2ef5005e3a2f2cc1254e953b0bcb7a58063f5a
--- /dev/null
+++ b/drivers/remoteproc/imx_rproc.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <asm/io.h>
+#include <dm.h>
+#include <errno.h>
+#include <dm/device_compat.h>
+#include <linux/arm-smccc.h>
+#include <linux/types.h>
+#include <remoteproc.h>
+
+#include "imx_rproc.h"
+
+#define IMX_RPROC_MEM_MAX		32
+
+#define IMX_SIP_RPROC			0xC2000005
+#define IMX_SIP_RPROC_START		0x00
+#define IMX_SIP_RPROC_STARTED		0x01
+#define IMX_SIP_RPROC_STOP		0x02
+
+struct imx_rproc {
+	const struct imx_rproc_dcfg	*dcfg;
+};
+
+/* att flags: lower 16 bits specifying core, higher 16 bits for flags  */
+/* M4 own area. Can be mapped at probe */
+#define ATT_OWN         BIT(31)
+#define ATT_IOMEM       BIT(30)
+
+static int imx_rproc_arm_smc_start(struct udevice *dev)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+static int imx_rproc_start(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	if (!dcfg->ops || !dcfg->ops->start)
+		return -EOPNOTSUPP;
+
+	ret = dcfg->ops->start(dev);
+	if (ret)
+		dev_err(dev, "Failed to enable remote core!\n");
+
+	return ret;
+}
+
+static int imx_rproc_arm_smc_stop(struct udevice *dev)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a1)
+		dev_info(dev, "Not in wfi, force stopped\n");
+
+	return res.a0;
+}
+
+static int imx_rproc_stop(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	if (!dcfg->ops || !dcfg->ops->stop)
+		return -EOPNOTSUPP;
+
+	ret = dcfg->ops->stop(dev);
+	if (ret)
+		dev_err(dev, "Failed to stop remote core\n");
+
+	return ret;
+}
+
+static int imx_rproc_arm_smc_is_running(struct udevice *dev)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a0)
+		return 0;
+
+	return 1;
+}
+
+static int imx_rproc_is_running(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (!dcfg->ops || !dcfg->ops->is_running)
+		return 0;
+
+	return dcfg->ops->is_running(dev);
+}
+
+static int imx_rproc_init(struct udevice *dev)
+{
+	return 0;
+}
+
+static int imx_rproc_da_to_sys(struct udevice *dev, u64 da, size_t len, u64 *sys, bool *is_iomem)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int i;
+
+	/* parse address translation table */
+	for (i = 0; i < dcfg->att_size; i++) {
+		const struct imx_rproc_att *att = &dcfg->att[i];
+
+		if (da >= att->da && da + len < att->da + att->size) {
+			unsigned int offset = da - att->da;
+
+			*sys = att->sa + offset;
+
+			if (is_iomem)
+				*is_iomem = att->flags & ATT_IOMEM;
+
+			return 0;
+		}
+	}
+
+	dev_err(dev, "Translation failed: da = 0x%llx len = 0x%zx\n", da, len);
+
+	return -ENOENT;
+}
+
+static void *imx_rproc_device_to_virt(struct udevice *dev, ulong da, ulong size, bool *is_iomem)
+{
+	u64 sys;
+
+	if (imx_rproc_da_to_sys(dev, da, size, &sys, is_iomem))
+		return NULL;
+
+	dev_dbg(dev, "da = 0x%lx len = 0x%lx sys = 0x%llx\n", da, size, sys);
+
+	return phys_to_virt(sys);
+}
+
+static int imx_rproc_load(struct udevice *dev, ulong addr, ulong size)
+{
+	return rproc_elf_load_image(dev, addr, size);
+}
+
+static const struct dm_rproc_ops imx_rproc_ops = {
+	.init = imx_rproc_init,
+	.start = imx_rproc_start,
+	.stop = imx_rproc_stop,
+	.load = imx_rproc_load,
+	.device_to_virt = imx_rproc_device_to_virt,
+	.is_running = imx_rproc_is_running,
+};
+
+static int imx_rproc_probe(struct udevice *dev)
+{
+	struct imx_rproc *priv = dev_get_priv(dev);
+	struct imx_rproc_dcfg *dcfg = (struct imx_rproc_dcfg *)dev_get_driver_data(dev);
+	ofnode node;
+
+	node = dev_ofnode(dev);
+
+	priv->dcfg = dcfg;
+
+	return 0;
+}
+
+static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* ITCM   */
+	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	/* OCRAM_S */
+	{ 0x00180000, 0x00180000, 0x00009000, 0 },
+	/* OCRAM */
+	{ 0x00900000, 0x00900000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00920000, 0x00920000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00940000, 0x00940000, 0x00050000, 0 },
+	/* QSPI Code - alias */
+	{ 0x08000000, 0x08000000, 0x08000000, 0 },
+	/* DDR (Code) - alias */
+	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
+	/* DTCM */
+	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	/* OCRAM_S - alias */
+	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20240000, 0x00940000, 0x00040000, ATT_OWN },
+	/* DDR (Data) */
+	{ 0x40000000, 0x40000000, 0x80000000, 0 },
+};
+
+static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
+	.start		= imx_rproc_arm_smc_start,
+	.stop		= imx_rproc_arm_smc_stop,
+	.is_running	= imx_rproc_arm_smc_is_running,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
+	.att		= imx_rproc_att_imx8mn,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
+	.method		= IMX_RPROC_SMC,
+	.ops		= &imx_rproc_ops_arm_smc,
+};
+
+static const struct udevice_id imx_rproc_ids[] = {
+	{ .compatible = "fsl,imx8mn-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
+	{ .compatible = "fsl,imx8mp-cm7", .data = (ulong)&imx_rproc_cfg_imx8mn, },
+	{}
+};
+
+U_BOOT_DRIVER(imx_rproc) = {
+	.name = "imx_rproc",
+	.of_match = imx_rproc_ids,
+	.id = UCLASS_REMOTEPROC,
+	.ops = &imx_rproc_ops,
+	.probe = imx_rproc_probe,
+	.priv_auto = sizeof(struct imx_rproc),
+};
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
new file mode 100644
index 0000000000000000000000000000000000000000..7a82dc4a195b44cd4b2d5ce5767c2688dde69ac7
--- /dev/null
+++ b/drivers/remoteproc/imx_rproc.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2017 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
+ * Copyright 2021 NXP
+ */
+
+#ifndef _IMX_RPROC_H
+#define _IMX_RPROC_H
+
+/* address translation table */
+struct imx_rproc_att {
+	u32 da;	/* device address (From Cortex M4 view)*/
+	u32 sa;	/* system bus address */
+	u32 size; /* size of reg range */
+	int flags;
+};
+
+/* Remote core start/stop method */
+enum imx_rproc_method {
+	IMX_RPROC_NONE,
+	/* Through syscon regmap */
+	IMX_RPROC_MMIO,
+	/* Through ARM SMCCC */
+	IMX_RPROC_SMC,
+	/* Through System Control Unit API */
+	IMX_RPROC_SCU_API,
+	/* Through Reset Controller API */
+	IMX_RPROC_RESET_CONTROLLER,
+	/* Through System Manager */
+	IMX_RPROC_SM,
+};
+
+/* dcfg flags */
+#define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
+
+struct imx_rproc_plat_ops {
+	int (*start)(struct udevice *dev);
+	int (*stop)(struct udevice *dev);
+	int (*is_running)(struct udevice *dev);
+};
+
+struct imx_rproc_dcfg {
+	u32				src_reg;
+	u32				src_mask;
+	u32				src_start;
+	u32				src_stop;
+	u32				gpr_reg;
+	u32				gpr_wait;
+	const struct imx_rproc_att	*att;
+	size_t				att_size;
+	enum imx_rproc_method		method;
+	u32				flags;
+	const struct imx_rproc_plat_ops	*ops;
+};
+
+#endif /* _IMX_RPROC_H */

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
