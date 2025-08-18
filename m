Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A707B298D6
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Aug 2025 07:19:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9680C3089F;
	Mon, 18 Aug 2025 05:19:18 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDE1FC30883
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 05:19:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0Ih2h0l+NB4D350ZuI3YFMHdywEHCgijocaGIdlm6VHBEZ1tLo5quQHNvcACmfC+YuuYtHDWjCIZwXv9Vs/0dLCknT2UAgL1qOKqW3pX72eSp/M/HjMcbJbsGcfk1ZX4fx0RKLmjetPhZAxbfiTtVePA2cY13EY1awNb2JslblfGX1JQw9Oh6feMdGohkkpefUrl33t/ta+bRNkv+Ufgfow939mVBNuTIXWBpq/C+xozPR96EvM26Y9cLJuRpvQUhs8AsFiBXy5srxIyIgysxiStnRsc8c0JWXQS6oFrDiKwFrW8CZvfjodxzapdwhp9OQS1rMymMv2VxizIl6cbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hmq6gsA8oq1ucQlwKnGGKmAVCHxUN/XtdcjAwhBi0zY=;
 b=eK+mYDFCeAinM0s+x9JZ326VYkl/UkaKMO7OzwS7VWaSBzfjgzVd2BGV9hA0dQjGfoIOBa1MBaCxk98jEHDQ3SZ24rtJKqZ+KBQIHj9NwQmpOBVK+PEzf9KCR8jNGcirBfgzf+SHOaN+O+24mHjognwpEJq2Y6x5jemHV2sIaeENJyl4RdpsFR1344orHW6e/ipNsKpVyqpJ1KRjvmqRsNY58WGWmUbW4n/4PdovhHz6xd3UHTl+td+YwIT+3FDEQ5RJLiHkGH1tycl46OX82L8a2aFKiClJKnyYIIXzl7Z/dEsRipcx81aniax5+iU0gHmljsq5wzgAS2mnzDVHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hmq6gsA8oq1ucQlwKnGGKmAVCHxUN/XtdcjAwhBi0zY=;
 b=Iyjmvyx/6xdGEhDHRrzpUSMqJrqJy0cbKTgsDmQnQJolMX7gCjQEX0q8hBood1uNfx3h0BoIYVYHfEuh9ADBA8/Z8AJqm3M1bvQjRWhQFh0GEFGf1tZbQjWht2VIdPOxXMtza300xvtRPtUozDhxNL/eLjN7cQexI4ZDX7nQsl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by IA1PR12MB9500.namprd12.prod.outlook.com (2603:10b6:208:596::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Mon, 18 Aug
 2025 05:19:13 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 05:19:13 +0000
Message-ID: <de97837e-32c4-4424-952c-2b5b58613cd1@amd.com>
Date: Mon, 18 Aug 2025 07:19:09 +0200
User-Agent: Mozilla Thunderbird
To: Andrew Goodbody <andrew.goodbody@linaro.org>,
 Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
 <20250807-pinctrl_misc-v1-3-eeb564a1b032@linaro.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20250807-pinctrl_misc-v1-3-eeb564a1b032@linaro.org>
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|IA1PR12MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f86f58-54be-46c7-74b3-08ddde16c4f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0FRTFVKeWNoOFlLVXlKY2NBV3ZqaE9WT0RHcUEzWklTaEF4aWVrSDNmWVdi?=
 =?utf-8?B?Vm00VzhveGNLUmNhNUhFRWtCQkw3SXMvY3FLbWVLeEIzT3lkU1FrZDNmWjZr?=
 =?utf-8?B?L011U2J2WmV4dndZWUtScTVMeDl3emlXZ1dGbXBmM2NvRW5kOXZsREZFOUJr?=
 =?utf-8?B?M0M0dGNBRUJMempvMXJsL0Vmc2wzL2VzYVBBRDJzMUZIV2J3RGNKcHAyVTc0?=
 =?utf-8?B?bEU5TWpaSmhXblMrc1dGVkErVUxJOW1YY21PZHdKbVVYRmo5Y1JRZEJSYjhK?=
 =?utf-8?B?bkdmaFpFMGNXL1BER1V0WmJWeTBUUUxrWmIwT0dUU3NySG9JOW9SUTY2a3FQ?=
 =?utf-8?B?aCtpaU9iSmh6T1FYY0lVakRIMFZ5QWZ5ZVlVYWRJVHUwb09BQ1lybGdzTzdR?=
 =?utf-8?B?RXozcWs0K3VpdWJMK2g1aW9CalhFUy9qYWQzQ3Jmb01oVFkveGVpcTMvQUU0?=
 =?utf-8?B?bDc5RTdBaTIwTW5mM213bXovQ2lndVBUUWZYa0ZKU2lyVXllYjFpQ0M2RTh6?=
 =?utf-8?B?aVlNVURHRXQwRUptOHVmVU9lQ25sRW1zRW8rN2FpREFpYlVBd0o2MjErenk1?=
 =?utf-8?B?c0xraWVIMERVUnZ2OVNXTHJIc3VxUnk5bG0zWng1Um0vaThQL0E3SS9TYUVR?=
 =?utf-8?B?bi8ycHlOL1lyNnVMT2d3L000OGNNcVNBd2k1NVJrWnQwclFqTUhFUzFWTFlw?=
 =?utf-8?B?TFBSdGFZQVdoS1NQNFBaV2ViNStPa0l3dzkxdmFhcTM1R0ViMWp1T1JCTW9O?=
 =?utf-8?B?ZTdzUU9TK2IyMXVKaklucXB5YnZqUE9KRVdVZmJ6Q1VkOFNBSllZQkRUb2M4?=
 =?utf-8?B?bXI0UUplSldwUVQwL0ZqTDd0WTRIRkZoSDRiTDlIRU92K2ZQUVBsMVhSTk5O?=
 =?utf-8?B?UE1GMUlhOEFvOGpyRDVOTUM2eE9FOENud2dkTTBxOVFkWC9kQy8wM1pMNysr?=
 =?utf-8?B?VGk2clNPNFFmd3VJSVFwM0IwTnc0MlhsZ3Y1WHBuc24xQkFlNjVrMnVyME9Q?=
 =?utf-8?B?S2RWclNPckZKVmoxMGpGS0NCT3RLektkQmNWL2pRc0g5bm1XRXczU2ZCRkR3?=
 =?utf-8?B?L2lINlZGaWI4WllMdjBKVk1mNFVLU2FYb3BzWVpFUEdaU2Q3eXYxMWlrZVFU?=
 =?utf-8?B?MnkwL2RyTUx5RVZQWHZqYndCNE5lN1Jsbm12TFh0R1ZicmcxZTZZWlFMa1RE?=
 =?utf-8?B?bU9QeExDQTV6ZUx4VFBrTytvN1JSeWowMkdvaldkRTgwUWViYTVSTEZmbk5x?=
 =?utf-8?B?RlRUZU1CM21VY05aazZocEV2MTh2N3ZVSFpISDRCUys3a3pPNCtCeXNKVmZO?=
 =?utf-8?B?U1dhdDJ0QzYzVGQ2VkZ5T3JhajNFd3VFeE1naVpoRjU1K015MTE1Q01RcUZQ?=
 =?utf-8?B?cUljWjE5R2VFM1BxY1lXc3ZTNmgyZFRWOHl1M0hEUUpETEh0WnBFVWRhWXh1?=
 =?utf-8?B?dHBIYlY4NEJ0dDhBcW1GZGpENGtucUZKMXIzNmZMTXIzUFlUd0NmSE1mTXJC?=
 =?utf-8?B?VngraDdaQk8vUjNWUDZxVm1UK1N0ajNWYXk3NFowanVZRDNBeG9nSFpYS1ZC?=
 =?utf-8?B?NWo3SkF4aFhkTWtuWHI3dTVqVFlJSVpSOWc3WTlZaGpTWkdZV3NsclpDY2do?=
 =?utf-8?B?RUFMZTByOExXZEZUQVB6RmVEdG5wTUhFQ2liUmZFcTZNTFI1WDUrbGMvUkhz?=
 =?utf-8?B?a296eEpvOXA4V09VaVYyOS9JdnEvQURxeHprQnp2YkNOc1VrWWZNdWVsdVRz?=
 =?utf-8?B?YUlFL244VGFwbHBVOHJ2b3U5bFAwZlg3enAyOFRqQnJNemR5R0VVMEFZMXBD?=
 =?utf-8?B?bnVUNzc5L1JsS2grNDhmZk55eVkyYnJ0RUh5Sm9xOUppcDlYeE1Ncmgxc2I2?=
 =?utf-8?B?d0N1Z3h5MkIwVzczS1VBWklFajZhWEluTmxMN0RZK3VuZGFKMWphU1JOeUF3?=
 =?utf-8?Q?EzI8FxmwZac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8109.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnRCQ3JncGloY0NoQmo0Mkc0d05WZ3FVeTI3dC83Y2pUZW1wSkd2VjJuSDJ4?=
 =?utf-8?B?Rm5wajFQWjZoM0RHVWUwQTZ2d2k5UHdFVEhwWnRVeDljYkllQXAzOUkycEtS?=
 =?utf-8?B?WFF4VWpDL1l3cVhvL2V1NWM5RUJkNXUzNVZiWUsvSVBobFJ4ZnE1a1MyNEEr?=
 =?utf-8?B?WUowTENQaXhMclZFaFVDTHR6aUR1SVhNakNjSjlqWUV1MHBES09VVEx0cGRY?=
 =?utf-8?B?U29ZZGtsT3J1U3N4cVpYSjN2OHVyUjJ4ZFhWaGFVdmtlcnRqTnltcHNBaDcy?=
 =?utf-8?B?ckNmdjdQMUlZWjhqM3FXRkFZMTRpaEU3SEEzcGdxZnNabzIvT215cmFKalNP?=
 =?utf-8?B?WVZXWU4zYldDSG1McHdiN0gyblFSU2JTaWxmMFlJK2hwVWVTeVMvV1RkNlpq?=
 =?utf-8?B?aSs1NTl2V0ljeURqajVrS3NvY0I1MWhSSjVTZ3M1cW51VXEvcmsxbW9JVkxJ?=
 =?utf-8?B?SlFzUkpYU1hrbWsxc3dPZ2lUZmVXWTczSGlIc2dYVXdSNS8vajUwRVRYY1JV?=
 =?utf-8?B?SVVsNExZRTMwT2ZRL3NsNlpLTWFoMk9ocDgrU2dER2VPZU0yb25pQjU4NVhB?=
 =?utf-8?B?eUhNZG01eDFvcCtoUFdzRDhjWXQ2UXQzdDJoeFQyMEhTYkR1ZStCWGp5WGVK?=
 =?utf-8?B?SmNudVRVNUZCUS9zWWZGeCtNWDB1Mm5lZmVXQSs0ZktvUlBnMFMzNno0eEFi?=
 =?utf-8?B?UmhkMEpKeEhkWjZheWVNNlhHSUtIRWpQdU9NRE1KVjlJczhya0V2ODRmNHIy?=
 =?utf-8?B?VGVlUXJnKzd2bm5JdXZXVVY1RllUYkN5aWFNc2FlbWoyMmFYRE5uRm1XaVEx?=
 =?utf-8?B?SzhEQ01YQmprVTVVakFDZ0RiRnVEY1FMNnBsbnJRTlFhRFMzOWZrVEF2ZUov?=
 =?utf-8?B?NE50U2lUWjJxUmlLcG51UjkvN2haZm91SjIwU3g3dEtLM2lBNlFxemszTFlX?=
 =?utf-8?B?bDlKdmZsZ1lsaDd2Uk9aeXg1N2VRTGxhMlNzWEIzK2dJSGJCNGNUZHNyb0lE?=
 =?utf-8?B?WUVzR2R2dVRmYUQrblRIek1taFdXcVQrbEtXTkRvdXVINTNUUXlqWE1MbVFl?=
 =?utf-8?B?L0RuU3FWdW03dWU0Z2JuYUVuNDgzVGVFTGcxY3BwN2lxRmtYRCt4bUM4UXNj?=
 =?utf-8?B?MjFLK1B4dHlGZ2dGeHlIL1VrWE5ZTSthRmV6Q3g0RW9vNXZtUFBuRm0zcFJp?=
 =?utf-8?B?cjVvdU1RYVo3YUJLamVjSXdweGNnQjdScVk4T1FtRnZkZjR2WGZLWWFicUcz?=
 =?utf-8?B?UDkxV2VxeUREbFFiYUNYbEc5M1d5Mis0bWRNRS9VOXgxK1BZRjRjYzNwQW5x?=
 =?utf-8?B?cC9kZ0tKOW9WTXF2enZ5ckh2eEd0V0J4WDNWQWtwMytmeEtLdkdGK1E2Qng0?=
 =?utf-8?B?R05XeFNNY2NsZUVKWjNFVHowdHJFK1p3alh5SUJjVTJZTHovb1AwN0VQUEN0?=
 =?utf-8?B?eHd0bThRSUU2TTJ6dHZJbitXUjdsSWhnT0ZJSzRDRjM1clpQbEplUnVSQWZY?=
 =?utf-8?B?YzNGT1FRTnR5K09aeVNnYzgvejRaVmZJM1ZKWXpURmU0TUlCSnBxc3ptSkNq?=
 =?utf-8?B?elFDNXZyMUhDV2FmSHFta28zZ1lhbDFrdlZFVXlwSEk5QVc4cFE2aHdLdy9Q?=
 =?utf-8?B?SEpLL1FsMitwNk1pclBvUVVUVFpnT21mbU1Gb1dFRXRvVjRzbDRrMXdJb1RT?=
 =?utf-8?B?c0crd0lWcGxjWE9nK3paNEs4ckJXS1d4NnVrVUcvazR0MUJyTGFuT1dXdDFV?=
 =?utf-8?B?V3dUTzBWZFBMZit4em16WFI2L0UxMjkrR3R1dWdLVmt1czE5Y0l5R1VTbTgv?=
 =?utf-8?B?QzVpRDcrWStVa3A4eVRteU5BWENVUXV1UEN3aUZ0NGpzY2o5Ui96eFJ4TVVE?=
 =?utf-8?B?emQzQUdTYTRkNGZBOWJ0TDRlSXM4VDkvSW4zb3B4aDMxL2dSYVN1Q2xjTDFw?=
 =?utf-8?B?cytWTlcwYXU1RTY1dlgvSUxSaU8vS1pud3pzRVRiK2JxUzFadjFiUXFsQzM4?=
 =?utf-8?B?ajdtYkJoM2k3dWRCK2FZS0RZejM2Q21PZUd1ZUx5T0Jpc0t0U0k2dUFJWnVo?=
 =?utf-8?B?ME9POFBJRVlGOHAwbzNWTnVsNGhVclBsTVo1RUd1ODlGc0xUSjZRa2IyZ0s5?=
 =?utf-8?Q?uLrjYdbVQMhJZrTFR7K44gHT0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f86f58-54be-46c7-74b3-08ddde16c4f1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 05:19:13.2710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mt3udaL2cChRtmGlxqxQHh0kbLfO8sUK+8vqFA2WnOPPb+6rL6WtLsb35aiE5SSI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9500
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 3/4] pinctrl: zynqmp: Ensure ret is
	initialised
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



On 8/7/25 12:04, Andrew Goodbody wrote:
> In zynqmp_pinctrl_prepare_func_groups if called with func->ngroups == 0
> then ret will not be assigned to before its value is returned on exit.
> Initialise ret to ensure it is always valid.
> 
> This issue was found by Smatch.
> 
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> ---
>   drivers/pinctrl/pinctrl-zynqmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
> index 6fa203a3b86..27dadbff8ca 100644
> --- a/drivers/pinctrl/pinctrl-zynqmp.c
> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
> @@ -204,7 +204,7 @@ static int zynqmp_pinctrl_prepare_func_groups(u32 fid,
>   	const char **fgroups;
>   	char name[MAX_GROUP_NAME_LEN];
>   	u16 resp[NUM_GROUPS_PER_RESP] = {0};
> -	int ret, index, i;
> +	int ret = 0, index, i;
>   
>   	fgroups = kcalloc(func->ngroups, sizeof(*fgroups), GFP_KERNEL);
>   	if (!fgroups)
> 

Applied.
M
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
