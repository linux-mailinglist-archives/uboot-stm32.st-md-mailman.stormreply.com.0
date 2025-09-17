Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4809EB7FF24
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Sep 2025 16:25:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06F01C32E93;
	Wed, 17 Sep 2025 14:25:40 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013036.outbound.protection.outlook.com
 [40.107.162.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00FDDC32E8D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 14:25:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rB7XH3u+hGCI/LzjM5cDoVq3YojgUpWtd/jj+FX/QS4ZPdd19IHFN5P8Ms0NQvcOQBlVeV9LzD2ywPtSmfIBYKVSn5+uovhVI4cP5j5V+iRtlm0J05sCnyN8Ii5PXRRHa0B+WbUv8KGIzqZRiH4ZDnuNsHUi7YpnqCbZxLdOJaJ3otiGO6A/nQgBq1vKoU0KKih4StBhmj6DTPX37IYvh8ILbZQaMY55iDp+znQSKCYVjWWH7rhkURVQAqdf4Z/WzkEBUGDJf6JiHrjmnwVnXo22G5GmB99fhwANC1lUmn1Lt04ztzz580DTZs2p3nC2GO/J8dEdE1lxd92HbWFk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZbe7H/3rTwg245p7sRhH9uQzUFC3IyTFmnJNz4Oe1w=;
 b=H21ct586en4nHayK3G/X0HVSpgSv4IqoA7OXhBGEhFEryUl9pMTQMy0GSDV18D7OtCAi787GFSk6AKsODoPqUP1Tr75d/2rfKsXWiWm78KX5i+Fme+AffBNkpuhqmsl8+qoa6VKnCrcHWIDVpkd2NgttcxDe49FsD9xOGNXq4romjOg62iZ8uRXUM+sS3FnU0uXz03vreWoV9AAxFUKOCC5WWIGOaA+pKh+lN7XIsAVmUZEGLzswWLDfB+oLGhANx1tQo7cUiO3SOwOp8hdn2oAoK0WrsyZ0nnBG5HaQf/cbzYOe7vr4B1PLhBEAH2BhY4JQt54BNEmnypSnCxLYZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZbe7H/3rTwg245p7sRhH9uQzUFC3IyTFmnJNz4Oe1w=;
 b=Fn+xCT0pUN/PVHbG2g83WTR2IrAIoGYrKZpWbNkhgdWgRIKeAy8KUUlXnCn0YCeCUWqQ4SHkFO59bEB9FL4LGcdxO1QHbVMpKv5KSlMxQTF14qSa167xVQ7pXOsE5wVHPUR9JlnVyVlakPYt/VqTXwMoIRUsHXlN9mjEjwdm3iA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS5PR04MB9730.eurprd04.prod.outlook.com (2603:10a6:20b:677::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 14:25:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9137.010; Wed, 17 Sep 2025
 14:25:37 +0000
Message-ID: <a74df246-2e53-4c73-b545-58ca832f7d83@cherry.de>
Date: Wed, 17 Sep 2025 16:25:35 +0200
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
References: <20250917141736.59732-1-kory.maincent@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250917141736.59732-1-kory.maincent@bootlin.com>
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS5PR04MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4fccd9-a5a4-424a-71b1-08ddf5f611ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFlNY0xpZzk3THpRaHJ4TlRlYWJQWnZQcXZSbDUyMXVGSmk5RnFTK3V5UFdR?=
 =?utf-8?B?VG00NTNaRC9QWWNQR2p2Z3o2Mk9QQ1dOKzVzSDk0OXh6SkxMWFcrVDJMNlVV?=
 =?utf-8?B?bmx2SDJLeEJreVhlQ1Q3ajF5clFvSlI5QjVTWFc0Snd1TklxcWJXZ00yblRr?=
 =?utf-8?B?SnFOajhuSS9UbnV1MisxMUZiWkZKU2hST1pkeHB3N0ZvTzVxOGdwNkxjZXpF?=
 =?utf-8?B?UnhwMnk1YUNkNzVaNEp5V1h4SjA3Mm1JU3pETW9ocFFyR1BVTm0rb3NLQUcr?=
 =?utf-8?B?SVRjYUt1MFZuaWpGZGxVRzJYN2RZd2UvVVNSeDJ2NVZ3ZEhtbWZOMms5WXhR?=
 =?utf-8?B?Ti84eVFUSmswWndJVE44UzhtelVrVU1PYWRadDErT3VVVHk5UzVaRmFOYW5C?=
 =?utf-8?B?NmJ6OTdFa1E4RExDMi9IYjRGSEZMV3RnOUxHMEt3ak1CdGlvTXV6Q1N5cW54?=
 =?utf-8?B?dFdEaVBBWkxjNXdkS0ZaNVpNb3J5cXBldkJ6cXY4dll1amU3VEtMbkp5YlNh?=
 =?utf-8?B?WVkvTE9CYjZhSmxlL0tBS0VObXczNmtMeWRHamxBMmRFbE5waEFwQW1DenBz?=
 =?utf-8?B?Y2labGYzQWVMTkp5c1FRT3l0RzJGb0loeENSVTBNVE9EZHJudjZaTDdLaCtV?=
 =?utf-8?B?ZWx6ekk5QkI4SmduR1VsdjR1V2VOdEVCaCsrbThUZWV5K3lvaXZhV0RiY2xB?=
 =?utf-8?B?TExoUklIbHJtYS8xdmhKSzYzUFc4S3RIb3hib1FDRng2cldwOXJpREUyR2FW?=
 =?utf-8?B?WWpRNTU0S21CTzRXdGJQZ0xUelc2cTcvOXhNOXFhUWpUdUcrODdjZmlJeHNz?=
 =?utf-8?B?ZmFiS0lvempmbzYvYnJCQ3pCSStkM2xaWVg1ZHlobldTU283dXZndW5wWDNC?=
 =?utf-8?B?WEQvUDN3R2JCcnhzSDIvU05EQUZQc2ZFeGcySTVCMzhGUmxENE8xR3NNNVk1?=
 =?utf-8?B?SE1CZlZjYndmYVR1d0RzdUdFMlZMY1NJdWZtdVAyRVQ1Mjd1eFdqblZTNUVj?=
 =?utf-8?B?RXE2NlJzclBPZ2lDTlliMVlyQXNEM3J1K3pmOWlZeWFCWVZxZUFRcnZPL3RL?=
 =?utf-8?B?ZHI4UHkvSG9CYW9rUnhUYVJSeDIzWllIL0NMMHZMaGw4cFU2QVBBaGk4UGlx?=
 =?utf-8?B?NmVKYzlZTjFRYXRKOUJ3aTRJdDlWTjVwM3ZUbm1pV1luVG5EcWxJcEIvUFBp?=
 =?utf-8?B?VXQrRVR0VVI2V3pZSStzTnpMY1Bqd3JMVXVMdVZQYVdMSm90WWRjY0NldVoy?=
 =?utf-8?B?UDBKNlJtTnk4SjhKNDdSOFIzc3hHTU1NR0JqakorTTZtSU5wNU05b1NSWnEr?=
 =?utf-8?B?cVQ2Q3IrRW45RjF4aHVYYldZOGd0QUE2ZmU5MjdMbXF0ZGx1cWhSdDJSWld6?=
 =?utf-8?B?MEphOGpqa245WGtmdTAzOTdlMDM4TldYMUVyajROSC9ZWEFmSWVYbkdrTXVz?=
 =?utf-8?B?T3RjbDN4NVoyWlRNNFhibnBaYVJLcmVqc1ZXL3UrVm4vTHpIWE54NjVzREhN?=
 =?utf-8?B?cUJyYklOZHQ3WTQwSis2d1JYSkhoM0d5TmVzWXBiYWgveHdGZENDd1lqWm5T?=
 =?utf-8?B?TzhXSy9MYStHeWd0enVMbkluaXlJVUppdFdzVXJYWXI4VjJPSEdzU1daYjA0?=
 =?utf-8?B?RFN0cG1RL0J0QW9QZ1lMcGo5eStsb0g2WW53WkNMYnJWTHZ5S04zTjhjRVhw?=
 =?utf-8?B?cXMzUzFIUVhGZVdhcFB0VFkwVTlPTHdoZVZKU0NHeEFyenFzcXFINHNpanpJ?=
 =?utf-8?B?U2FoUDVFQTRndnZtaGNGd1h4V1hTZElrekRzSmRyU0szK2xRQml2dWhXb3lU?=
 =?utf-8?Q?wprs9kVeCwMs3FTlUnWflgkb/VLxLObzmhMQk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0QvM1lPTS9VZ3JZU0lqRUpnWWs1dmZ2bEFsV21jQyt6eVh0TWtUWmpOZm1q?=
 =?utf-8?B?VzQ3blc3RXhWaDkvWVBRZ3RObkp1SHI3QzNIdEhSZG92VXBYUlBrTEljblVJ?=
 =?utf-8?B?L2FmY0h0dzRGV0txc0hCODhxZnl4cU1vd3h5ZUo1TW1rdDlpY0hsV3M2VTUx?=
 =?utf-8?B?SzNrL3FoTjB6NzYxVWxJQVluNXh2bHNBdm9Ub29BK2QvSUNuNGptdXl2bUc0?=
 =?utf-8?B?cElJeG5FRytzcDlxYWc5TnFlaC9SemYyZmVSKzF0eXRobnF1NXdlRXRFZlJr?=
 =?utf-8?B?U1pOQm5xVnJhdTBoQTd4S0NQZFhuQXd5V2UxVDFUUXZzRjhtWE95VFlwdEhj?=
 =?utf-8?B?R0I0dU1TY0VVckw2Zk1YbDVyYzllOHA0aEdhZXVwMEJjekhHSllNTmxBc0FY?=
 =?utf-8?B?SVBIRm1qNmxSSm95UUdmZkRmWEs0YlY5TVBtUWhOamlpSTlpNGRyaHJaclhT?=
 =?utf-8?B?UGsvRVZrUVp6Rk51L2hqallyQWRSaW1Ya0hBQWw5a0lVLzNaYmdGWW5YZEY2?=
 =?utf-8?B?OVYwZWVaeDlCTmZKYmNQNHlZdUJuRFFWbDRjZFBLZU43dXJPSHFXamV0N2hj?=
 =?utf-8?B?UlhkdG0xQ0dCZUN4ellxS2tweXVIdUp0RmVBalJYTGYvZXZ4QjBMUk52WUZ6?=
 =?utf-8?B?RDVPV25yMnI5UmlmTkRQMEkrWll5MnBBQnVNR0dkd1FJdHB1UVJLVG9lTi9z?=
 =?utf-8?B?UFVjOEVvZ1gwL0UvV0I1ejFSSWNnRmRwZnozZmhURlpncXZCSERST3VkODBn?=
 =?utf-8?B?cHZqblN3MWNFL3drWVM2RlVEK3NXeDV1Y0M1M1I0SXJsQTF6enhmd2c3RVpB?=
 =?utf-8?B?NnpkNVJpalRnbGJJeWRtemRUaEYyckRLd09Ub3NmYndjOGtzWDR1WHU5UUk0?=
 =?utf-8?B?WGM1WkdydXNiYjUrUzY2ZlEvb0RkajRKZWVGME5UVFdkMEJUVDR6Q3YvbzBT?=
 =?utf-8?B?cVUzdG8vdEZPdFJlcllkRlkvQXJWNitzQ1Y3OGtjcW9DQ1AzeXNlZGhkWVRR?=
 =?utf-8?B?SEM5MkJibWdkYVBEQ3lIOU5kUlBjVCtYcnh6TmZ3NXpzQ0VrT2U1MzI2a1JU?=
 =?utf-8?B?ZVV1VnpBQVQ3ek91cVlLcUlOSWx4djRzcC9kbFE3MXlVYyswVUNRNEZ1d3VE?=
 =?utf-8?B?ODM1K01SNzBJZVNGNllBS0JVa2ZxU2xqWmwxZldwV1JoRVNnT0lYWnRzc1lJ?=
 =?utf-8?B?KzVEODZUbGQ5aCtHaC9vODVrNStsSVVuK0lhZHFLVnU1V1ZWcXVNYnVTdGhk?=
 =?utf-8?B?V1Z2TUI1SzZCU0xXakRveGhhRi9KdVl3T0R6MnhxOW8vZE4xNmpjSXhkMjAv?=
 =?utf-8?B?YzBGcTNia3l1cncvV0VaZVg5dkJoTzZGbklKVXBNcTk1UFl2QjZES2ZJdHB0?=
 =?utf-8?B?c0pGTDBhdld4YldoSlM4elJNQUV4VmVVSUc3MXpCNmlnc2g4VmVpMGlWL003?=
 =?utf-8?B?STlhb2dkOHhwWjg5eWdlNGxYZ3pCVWI3MHAzcHp5a3NZRndpdUUrdWJuNjlD?=
 =?utf-8?B?b25hYi9rVnphd1o3cThrbldjYjhZcXNsNGMyMlZRSXVyWldlWDVkNE5zVW50?=
 =?utf-8?B?U3I0WXptR2p2M0IxMGppaGVMY3ZFTzZrUlhpVW1CSy9TMUdjZmNqaUNKU29n?=
 =?utf-8?B?aE5DWFkrc1YwRjVmNGZLb2RoUDVnM2x3aEpZa09Ld09aK3ZoL1piUUpnYUZ2?=
 =?utf-8?B?SVlsYVNGU09URTdxWWY4MzdoUSt6WWtzUGtHSUpZSlBwMVhNdTJ6d1V0YVFw?=
 =?utf-8?B?Vmtab2h1RURSOE5pZlU5TEZBc095RldtWWcrR1huenQ1OG5RbVlNb2tSNzNm?=
 =?utf-8?B?L1BYUGdHaHJZVDVNalNDRkpVVjV3UGhtc2djL2J6NXhSOEVkL2ZNeEc1bkh4?=
 =?utf-8?B?cHpCME9MK0N4NmFjVThFZklxYndJemhQQ2h4Nmc1N2Z5NTJBVUNCMjdIVngz?=
 =?utf-8?B?ZGExa3p1S1pVd1NkajdTUEVUb0Y0R3dNRmdQdS82WWw4SUxWVjZuMXl3TENQ?=
 =?utf-8?B?UlB4TzdVWnBqUzNqcGZhLytUcEQ3eVNvOEtGdVVDS09OZXJNUi93Yk1VdU9J?=
 =?utf-8?B?VHhYemRSZlExam13RkJpZ09RcTdNSUZneDM2dnRPdldjMHdIR215UkhKNUpR?=
 =?utf-8?B?aHVPM01UYkN3MkdJK0VXd2NEVzlXelJYa1dERWphdWVZdy9pSDA1MHBGdGl5?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4fccd9-a5a4-424a-71b1-08ddf5f611ba
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:25:37.0474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSpjlfMYhJJO6y8EYf9tNsKE8e/EHpyYSekLyLPx0xNSQez2VPC4b3mN4kBNv88hxF07eJMo0U46vM87NUkrvzqv+hmJT3CkBvTsPjmcZ9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9730
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 thomas.petazzoni@bootlin.com, Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] Revert "board: st: stm32mp1: Clean
	env_get_location()"
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgS8O2cnksCgpPbiA5LzE3LzI1IDQ6MTcgUE0sIEtvcnkgTWFpbmNlbnQgd3JvdGU6Cj4gVGhp
cyByZXZlcnRzIGNvbW1pdCBkMzc2NDFjNjFiYTIxMjI0MWMzOGUzZmQyMmYwMzM1ZmMwYmViYzk2
Lgo+IAo+IFJlc3RvcmUgc3VwcG9ydCBmb3IgZW52aXJvbm1lbnQgc3RvcmFnZSBpbiBFWFQ0IGZp
bGVzeXN0ZW0gb24gZU1NQyBib290Lgo+IFRoZSBwcmV2aW91cyBjbGVhbnVwIGluY29ycmVjdGx5
IHJlbW92ZWQgdGhpcyBmYWxsYmFjayBvcHRpb24gd2hpY2ggaXMKPiBuZWVkZWQgZm9yIGJvYXJk
cyB0aGF0IHN0b3JlIHRoZWlyIGVudmlyb25tZW50IGluIGFuIEVYVDQgcGFydGl0aW9uLgo+IAo+
IFRoaXMgY29uZmlndXJhdGlvbiBpcyBPUy1zcGVjaWZpYyByYXRoZXIgdGhhbiBib2FyZC1kZXBl
bmRlbnQgYW5kIHNob3VsZAo+IHJlbWFpbiBhcyBpdCBpcyBjb25maWd1cmFibGUgdmlhIG1lbnVj
b25maWcuIEV2ZW4gaWYgaXQgaXMgbm90IGRlc2NyaWJlZAo+IGluIFNUIGRlZmNvbmZpZ3MgcGVv
cGxlIG1heSBoYXZlIGVuYWJsZWQgaXQgaW4gdGhlaXIgZGVmY29uZmlnLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+Cj4gLS0tCj4g
Cj4gRGVidWdnaW5nIHRoaXMgaXNzdWUgcmFpc2VzIGFub3RoZXIgaXNzdWUgdGhhdCBuZWVkIGlu
dmVzdGlnYXRpb24uCj4gSWYgZW52X2dldF9sb2NhdGlvbiByZXR1cm4gRU5WTF9JU19OT1dIRVJF
IGJ1dCBDT05GSUdfRU5WX0lTX05PV0hFUkUgaXMKPiBub3Qgc2V0LCBVLWJvb3Qgc3RhbGwgd2l0
aG91dCBhbnkgbG9nLiBUaGVyZSBtaWdodCBiZSBhbiBFTlYgY2hlY2sgaXNzdWUKPiBoZXJlLgoK
SSBiZWxpZXZlIHRoaXMgbWF5IGJlIHJlbGF0ZWQgdG8gd2hhdCBJIGhpdCBhbG1vc3QgdGhyZWUg
eWVhcnMgYWdvLCBzZWUgCmNvbW1pdCBsb2cgaW4gCmh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1i
b290L3UtYm9vdC8tL2NvbW1pdC9iMWYxYjRhNWE1MjhlZWVmZWEyODNjY2NhMmVlOTc3N2NiMTBj
ODQwCgoiIiIKc2luY2UgYXJjaF9lbnZfZ2V0X2xvY2F0aW9uKCkgaXMgY2FsbGVkCmJ5IGVudl9p
bml0KCkgd2hpY2ggaXMgcGFydCBvZiB0aGUgcHJlLXJlbG9jYXRpb24gcHJvY2VzcywgYSB2YWxp
ZCwKbm9uLUVOVkxfVU5LTk9XTiwgdmFsdWUgc2hhbGwgYmUgcmV0dXJuZWQgb3RoZXJ3aXNlIHRo
ZSByZWxvY2F0aW9uIGZhaWxzCndpdGggdGhlIGZvbGxvd2luZyBtZXNzYWdlOgppbml0Y2FsbCBz
ZXF1ZW5jZSAwMDAwMDAwMDAwMjg2NmMwIGZhaWxlZCBhdCBjYWxsIDAwMDAwMDAwMDAyNTZiMzQg
KGVycj0tMTkpCgpUaGlzIHZhbGlkLCBub24tRU5WTF9VTktOT1dOLCB2YWx1ZSBpcyBFTlZMX05P
V0hFUkUgd2hpY2ggcmVxdWlyZXMgdG8KYWx3YXlzIHNlbGVjdCBDT05GSUdfRU5WX0lTX05PV0hF
UkUgb3RoZXJ3aXNlIHRoaXMgd29yay1hcm91bmQgZG9lcyBub3QKd29yay4KIiIiCgpIb3BlIHRo
aXMgaGVscHMuCgpJIGhhdmVuJ3QgZHVnIGRlZXBlciB0aGFuIHRoYXQgdGhvdWdoLgoKQ2hlZXJz
LApRdWVudGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3Vib290LXN0bTMyCg==
