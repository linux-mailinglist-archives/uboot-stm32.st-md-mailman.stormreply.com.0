Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2014B7512
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Feb 2022 21:36:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 428B3C5F1F2;
	Tue, 15 Feb 2022 20:36:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B468C23E53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 20:36:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbHwv5d5W5QDEk5DlMTWOTQynqEWhXnr/CjwwjNQWR7lGWxvd5rBmQHC3gTfl6cddGKniRl56uaikQCtUWyNYqTo5eda0cXWkGCpg7wW/YEi56z+ZMCgDhogAadU6gRya8evNggPWMwV/uhiRJ/0TtbmP0GzvjDVh3D/jXcKVc8jVWD/kjUSQLTS5yQyv8WdITtMmPZdkNWRIrliU/TrZql+Apq/tRlJ/bAPlzjf5M3MowNTRXV+j5K0ExOqRGiuBi61P2GCh1rcoV9C6a7aoYM1hN0rReszZhtNmItgS1ysJ2vaV23nN7CgIw5/CE5yopyAUopxi7HQ/nzCBqjdLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8mmR9gXSAPblkEoMdGbYLVfocGV7xgY37dYgOfhNSQ=;
 b=e3xISOcIy7+OB/puUpY9gxI7GDKSA9rDnbkzanhblI8K3Z0zZw1DYrrDtspEDWeyEUvjcLvjPbDAOz+/5EFCKL8IXuO/8uub2aDr+kyctynl6N9dxm0PbbWkKWiX+oJ2arSwmqKqlJCCAJO9seeSyNzURyVerq/kUT2aV3l1JZst8tkSLP2k9vTG1bpgYHT0sJwwy+utfbD/EDGqDrBFsxkR5/b8NvHCmn8P1hYyyQBaXsxgPNkzrHB+lXtZHhUb23faLcpXgzfMGUiJMSvxX4MhFWTZf0BBboQ/Aym+a6xtLbRf6HsTqc4+lYC/KfNpuL1G8I7L/svqvykc5G+I8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=foss.st.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8mmR9gXSAPblkEoMdGbYLVfocGV7xgY37dYgOfhNSQ=;
 b=hJY/+G3JlaRC/Ij9V0rwfyQFQ+0leLKFTHp3MOd6mW7FR0AdTSVMXotWxuQEY/LmaHKfZbtJ2HfEgG1MozKqiFmgo+hd8vSjzdv2LpXLEXhUGvXThHvQAUvxtAK3sCEKOobON+WVXEndlR/8+tHJ8xswrSIwLZiKFStnHI5fEX/BnzoLgZ1l0vWRdIV4QmPTZz6cgHnhVrf7GlcGxKZrABL2uGUIv+U0vlvHvg3L5Co/yr1j3TeOa6Ff0eljxenknZvTYCIbasQ/ALiT9/2NMgDTFQ8o6iULgig675OtbPJPsM4ootG8DQ9CIwel3ejPgWig9ZWs4uDCJBTxs9wJvA==
Received: from AM6P192CA0073.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::14)
 by DB9PR10MB4780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:25b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 20:36:21 +0000
Received: from VE1EUR01FT049.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::9b) by AM6P192CA0073.outlook.office365.com
 (2603:10a6:209:8d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Tue, 15 Feb 2022 20:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 VE1EUR01FT049.mail.protection.outlook.com (10.152.3.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 20:36:20 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 15 Feb 2022 21:36:20 +0100
Received: from [167.87.0.44] (167.87.0.44) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 21:36:19 +0100
Message-ID: <6d267c27-9644-c7fa-2dff-65aad93958b5@siemens.com>
Date: Tue, 15 Feb 2022 21:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>,
 Simon Glass <sjg@chromium.org>, Nishanth Menon <nm@ti.com>
References: <20220104074248.25015-1-patrice.chotard@foss.st.com>
 <a0c92956-a235-622c-ca0f-9b5d6eef3e67@siemens.com>
 <5e8dcbef-2f40-a1b0-b750-ec82eac244fc@foss.st.com>
 <e16bac10-1804-ec88-b90c-f0851ddc1aaf@siemens.com>
 <02783446-94aa-304f-350f-31c304817f84@foss.st.com>
 <b82c2559-e2ac-38e7-7711-a1b678bc8972@siemens.com>
In-Reply-To: <b82c2559-e2ac-38e7-7711-a1b678bc8972@siemens.com>
X-Originating-IP: [167.87.0.44]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e596c550-d2b9-4423-cd56-08d9f0c2d2d8
X-MS-TrafficTypeDiagnostic: DB9PR10MB4780:EE_
X-Microsoft-Antispam-PRVS: <DB9PR10MB47806F4C5FA7D583A5981F0195349@DB9PR10MB4780.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2sY/tQu4aoem2bn12QFooyAeONXqcn10Kc77TUc1E7WWIzLW0AGz6INXpQ35oafBikHzbjXU4z8EdmUzq63ySUPGr+/Oy9J3167l9jRq28agBUr6hZJiyeRT93r93C1DZQRFHb+Efup0YO78x0DCs4vKZXzB9A7DBmeK5BVpOO8dt/Zvn1l2SyhKStIRgzi0y0HDPBsmx/MPp32pS82egjBrvm3drgwDpVLPZPuYOR5tFMP4MaZLSmRnrcttKntEki2+3j8iXLYAZDzpTxq80SXYOt44/9LvQxa7aGUya7bt5090HRof9DLm/6TEcWBDwgvPLDNxggYmb3oRmLRW+WswftaRboNDZ/DBPb7MZgnmUVU77Aq2ZUdV2kRVKNnRX6m1tztpP6Plgn1mCDAmF1jWXYkgZIBXOMzUHCImpgqJL/6H4aJnBOyMv0aFdgxlm02fI2DH2I7bFI10rLS18eXZGWWwIBUexeMsWqsGED2/9Eus1lZ1ur/aTos/bpmq9P9uSor0qXKq/8I2nC7f5g4LzAofb90e5exgDZOeFZX+qDA0V3/swTljtNCNlKsryAiTz/T0IpXgOOQ9rmL8Pg7k6u9t9gHvIEp+YrpU8BZAmFSwH7FrrXawP1wGASZuWyQi1jZVBRDV22YJtbF3kI/pP/FbEZbAuspQDcddo2RnuhTNnLtPlJEOUkjzKXQXYDRROJayd+F1tuAKVNkyJ3aSzV9gfSDmW+dAyB45xdVnYiJnAmw5Oyn+hiF5pNd+vglgi0RXd8MFUt8HLA23Osla8GrWvn0i7iq4XVrIjIk=
X-Forefront-Antispam-Report: CIP:194.138.21.73; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(83380400001)(356005)(5660300002)(81166007)(508600001)(36756003)(53546011)(36860700001)(44832011)(2906002)(40460700003)(8936002)(16576012)(4326008)(8676002)(47076005)(316002)(31696002)(70206006)(70586007)(54906003)(110136005)(16526019)(2616005)(956004)(82960400001)(26005)(186003)(336012)(31686004)(82310400004)(86362001)(6706004)(3940600001)(36900700001)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 20:36:20.0842 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e596c550-d2b9-4423-cd56-08d9f0c2d2d8
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.73];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT049.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4780
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: Fix OF_BAD_ADDR definition
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

On 15.02.22 14:49, Jan Kiszka wrote:
> On 15.02.22 14:34, Patrice CHOTARD wrote:
>> Hi Jan
>>
>> On 2/15/22 14:00, Jan Kiszka wrote:
>>> On 15.02.22 12:56, Patrice CHOTARD wrote:
>>>> Hi Jan
>>>>
>>>> On 2/14/22 16:21, Jan Kiszka wrote:
>>>>> On 04.01.22 08:42, Patrice Chotard wrote:
>>>>>> When OF_LIVE flag is enabled on a 64 bits platform, there is an
>>>>>> issue when dev_read_addr() is called and need to perform an address
>>>>>> translation using __of_translate_address().
>>>>>>
>>>>>> In case of error, __of_translate_address() return's value is OF_BAD_ADDR
>>>>>> (wich is defined in include/dm/of.h to ((u64)-1) = 0xffffffffffffffff).
>>>>>> The return value of dev_read_addr() is often compared to FDT_ADDR_T_NONE
>>>>>> which is defined as (-1U) = 0xffffffff.
>>>>>> In this case the comparison is always false.
>>>>>>
>>>>>> To fix this issue, define FDT_ADDR_T_NONE to (ulong)(-1) in case of
>>>>>> AARCH64. Update accordingly related tests.
>>>>>>
>>>>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> Changes in v2:
>>>>>>  - define FDT_ADDR_T_NONE as ((ulong)(-1)) and keep OF_BAD_ADDR unchanged
>>>>>>
>>>>>>  include/fdtdec.h   | 5 ++++-
>>>>>>  test/dm/ofnode.c   | 2 +-
>>>>>>  test/dm/pci.c      | 4 ++--
>>>>>>  test/dm/test-fdt.c | 2 +-
>>>>>>  4 files changed, 8 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/include/fdtdec.h b/include/fdtdec.h
>>>>>> index 6c7ab887b2..e9e2916d6e 100644
>>>>>> --- a/include/fdtdec.h
>>>>>> +++ b/include/fdtdec.h
>>>>>> @@ -24,16 +24,19 @@
>>>>>>  typedef phys_addr_t fdt_addr_t;
>>>>>>  typedef phys_size_t fdt_size_t;
>>>>>>  
>>>>>> -#define FDT_ADDR_T_NONE (-1U)
>>>>>>  #define FDT_SIZE_T_NONE (-1U)
>>>>>>  
>>>>>>  #ifdef CONFIG_PHYS_64BIT
>>>>>> +#define FDT_ADDR_T_NONE ((ulong)(-1))
>>>>>> +
>>>>>>  #define fdt_addr_to_cpu(reg) be64_to_cpu(reg)
>>>>>>  #define fdt_size_to_cpu(reg) be64_to_cpu(reg)
>>>>>>  #define cpu_to_fdt_addr(reg) cpu_to_be64(reg)
>>>>>>  #define cpu_to_fdt_size(reg) cpu_to_be64(reg)
>>>>>>  typedef fdt64_t fdt_val_t;
>>>>>>  #else
>>>>>> +#define FDT_ADDR_T_NONE (-1U)
>>>>>> +
>>>>>>  #define fdt_addr_to_cpu(reg) be32_to_cpu(reg)
>>>>>>  #define fdt_size_to_cpu(reg) be32_to_cpu(reg)
>>>>>>  #define cpu_to_fdt_addr(reg) cpu_to_be32(reg)
>>>>>> diff --git a/test/dm/ofnode.c b/test/dm/ofnode.c
>>>>>> index cea0746bb3..e6c925eba6 100644
>>>>>> --- a/test/dm/ofnode.c
>>>>>> +++ b/test/dm/ofnode.c
>>>>>> @@ -286,7 +286,7 @@ static int dm_test_ofnode_get_reg(struct unit_test_state *uts)
>>>>>>  	ut_assert(ofnode_valid(node));
>>>>>>  	addr = ofnode_get_addr(node);
>>>>>>  	size = ofnode_get_size(node);
>>>>>> -	ut_asserteq(FDT_ADDR_T_NONE, addr);
>>>>>> +	ut_asserteq_64(FDT_ADDR_T_NONE, addr);
>>>>>>  	ut_asserteq(FDT_SIZE_T_NONE, size);
>>>>>>  
>>>>>>  	node = ofnode_path("/translation-test@8000/noxlatebus@3,300/dev@42");
>>>>>> diff --git a/test/dm/pci.c b/test/dm/pci.c
>>>>>> index fa2e4a8559..00e4440a9d 100644
>>>>>> --- a/test/dm/pci.c
>>>>>> +++ b/test/dm/pci.c
>>>>>> @@ -331,10 +331,10 @@ static int dm_test_pci_addr_live(struct unit_test_state *uts)
>>>>>>  	struct udevice *swap1f, *swap1;
>>>>>>  
>>>>>>  	ut_assertok(dm_pci_bus_find_bdf(PCI_BDF(0, 0x1f, 0), &swap1f));
>>>>>> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1f));
>>>>>> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1f));
>>>>>>  
>>>>>>  	ut_assertok(dm_pci_bus_find_bdf(PCI_BDF(0, 0x1, 0), &swap1));
>>>>>> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1));
>>>>>> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1));
>>>>>>  
>>>>>>  	return 0;
>>>>>>  }
>>>>>> diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
>>>>>> index 8866d4d959..e1de066226 100644
>>>>>> --- a/test/dm/test-fdt.c
>>>>>> +++ b/test/dm/test-fdt.c
>>>>>> @@ -768,7 +768,7 @@ static int dm_test_fdt_livetree_writing(struct unit_test_state *uts)
>>>>>>  	/* Test setting generic properties */
>>>>>>  
>>>>>>  	/* Non-existent in DTB */
>>>>>> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr(dev));
>>>>>> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr(dev));
>>>>>>  	/* reg = 0x42, size = 0x100 */
>>>>>>  	ut_assertok(ofnode_write_prop(node, "reg", 8,
>>>>>>  				      "\x00\x00\x00\x42\x00\x00\x01\x00"));
>>>>>
>>>>> Since this commit, I'm getting this dev_get_priv warning:
>>>>>
>>>>> [...]
>>>>> U-Boot 2022.01-00766-g9876ae7db6d-dirty (Feb 14 2022 - 16:15:21 +0100)
>>>>>
>>>>> Model: SIMATIC IOT2050 Basic
>>>>> DRAM:  1 GiB
>>>>> Core:  94 devices, 28 uclasses, devicetree: separate
>>>>> WDT:   Not starting watchdog@40610000
>>>>> MMC:   mmc@4fa0000: 0
>>>>> Loading Environment from SPIFlash... SF: Detected w25q128 with page size
>>>>> 256 Bytes, erase size 64 KiB, total 16 MiB
>>>>> drivers/dma/ti/k3-udma.c:1744 __dev_get_priv: null device
>>>>> drivers/dma/ti/k3-udma.c:1744 __dev_get_priv: null device
>>>>> OK
>>>>> In:    serial
>>>>> Out:   serial
>>>>> Err:   serial
>>>>> Net:   No ethernet found.
>>>>> Hit any key to stop autoboot:  0
>>>>>
>>>>> (I've instrumented dev_get_priv to tell me file:line)
>>>>>
>>>>> Is that a sleeping problem surfaced by the commit or a real regression?
>>>>> I can boot, though.
>>>>>
>>>>> Jan
>>>>>
>>>>
>>>> It should be interesting to understand why uclass_get_device_by_phandle() return tmp = NULL.
>>>
>>> Yep.
>>>
>>>> What's the return value of uclass_get_device_by_phandle() ?
>>>>
>>>
>>> -22, EINVAL.
>>
>> As EINVAL is one of the more "common" error value, i think you have to go deeper 
>> to see where the uclass_get_device_by_phandle() is failing.
>>
> 
> Sigh, I was hoping to get around debugging this myself.
> 
> In any case: With this patch revert, the related code path is still
> taken, just successfully:
> 
> ti-udma dma-controller@285c0000: ret=0 tmp=00000000bdf10750
> 

To conclude this thread: The patch does what it is supposed to do, i.e.
define the right FDT_ADDR_T_NONE so that comparisons finally work
correctly on 64-bit archs.

As they work correctly now, in this case in dev_remap_addr_name, they
reveal that k3_nav_ringacc_init() tries to get a non-existent
configuration register "cfg". So far it got -1LL as result, != NULL, and
likely used that happily. The missing register came from a missing
u-boot specific fragment in our board dts, compare to the TI reference
board. Working on a fix.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
