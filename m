Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4FC4B6E06
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Feb 2022 14:50:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24C9DC5F1F2;
	Tue, 15 Feb 2022 13:50:02 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44D92C5F1D7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 13:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwNNyVHVX+icZw4SnpZv4B7sY1rYUakDuEN+TJadpoKat72J40n0XMk/95ZnnzMCGtblq+SoklEKYsfFGw5zEm0xM5Xhnp9tUg2j7k8xv15mCViDC6bpccfOK8WmPWlP9aZ0ylJBvl2gT4sr+qZ62t6IPuAJsULHm9qnIricsECjwsoubCVXJqA8Zb47RMjJP8+YlVaIJZA/sL7wi/8N13BF57o7WR58Ctoax+pBwpRT8bnnUzBpM8eGfAw95U95SQ9hR5vTONBVfFI94AOLF7dVLbWaRI2N8ubzmfe224QkQz9bWM3JgvbRKmZEB3COa99vl4ikN5UvwxIZh/298w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lag9pt4W/uyr6qol4oriMP4hx0i5l0VSHzoqOJg7gMA=;
 b=nrIkv+2zUoSBB0rRU0Ykly/SifnP1nESCdofEZuSm+Ep6uUfeb2EV187qhHYIbcphwBKVa2yt13W9MEH9WNa1jSW0YmunMIIl2IgnJYTYrLcW3u5cOjhziuuyw+Wq7tWfDlLAihu4BcUHNdP7xQ3ZkwSk4m9gHb59ZsBtlineFiFUvjFPKt0HqfkJ5OkN90O/qSkjmYtW0eG9CJA9KDOhXrNmQ9zgsREqcHkxw138eI6EVZys8jd1BNVIN5jYbLboM/CSuJNRuuxYgWIm3W0zcy9BglMbWPPFujO3PMiK/d0fxDn+pIrYbnuH9sfiqgWpg/In0/nCX2oLFBiXn9uuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=foss.st.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lag9pt4W/uyr6qol4oriMP4hx0i5l0VSHzoqOJg7gMA=;
 b=L8HRdNYqMFgcOy7EkPukypOYmBWldQGwU1WhVzKXcmDOiS8DOcgeezf68iC/RhLS1YI7XVaS6M+gscORv6KAkhlfRUDOgPUDGRl5w1OYkKF85ngIN0Va8gwOhv/YvRLZuOuPzZPSmwu2Jhw3lKMjAORMIqA6payH2lx8ki6jIaqDj0eU/YXoXESh20+gefvUYyb8GWvL3gbzPX8yF8orGkw5oUdcO1IhoC6Bpm2K1LWJEPXtJ98uE9wSubMaJEZusfXHW4yJ0G54LZ0aI9+Khw/4FUpxmGzzqgl5ms0CfKQiyBzuH1Gl+a+hrDkHWezS25qXIqA1ejAZUUbAwpduaA==
Received: from SV0P279CA0010.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:11::15)
 by VE1PR10MB3920.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:16b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 13:49:59 +0000
Received: from HE1EUR01FT022.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:11:cafe::d8) by SV0P279CA0010.outlook.office365.com
 (2603:10a6:f10:11::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Tue, 15 Feb 2022 13:49:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 HE1EUR01FT022.mail.protection.outlook.com (10.152.0.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 13:49:58 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 15 Feb 2022 14:49:54 +0100
Received: from [167.87.0.44] (167.87.0.44) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 14:49:54 +0100
Message-ID: <b82c2559-e2ac-38e7-7711-a1b678bc8972@siemens.com>
Date: Tue, 15 Feb 2022 14:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>,
 Simon Glass <sjg@chromium.org>, Nishanth Menon <nm@ti.com>
References: <20220104074248.25015-1-patrice.chotard@foss.st.com>
 <a0c92956-a235-622c-ca0f-9b5d6eef3e67@siemens.com>
 <5e8dcbef-2f40-a1b0-b750-ec82eac244fc@foss.st.com>
 <e16bac10-1804-ec88-b90c-f0851ddc1aaf@siemens.com>
 <02783446-94aa-304f-350f-31c304817f84@foss.st.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <02783446-94aa-304f-350f-31c304817f84@foss.st.com>
X-Originating-IP: [167.87.0.44]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 450dbbe5-f988-4f9d-b9e8-08d9f08a0e5c
X-MS-TrafficTypeDiagnostic: VE1PR10MB3920:EE_
X-Microsoft-Antispam-PRVS: <VE1PR10MB39204039C01EB182801C2B8A95349@VE1PR10MB3920.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6iNmHvC/RTFA49pyb5kdLp+ifcFka22rWmIHpF19SBpaLyrhQjkLMhetY+iTWLrpYfMDZSDCa2M+XizclRWmEMJGwGfSuTinWkBcBuvF9iZGB2z4H8gOiYIGGsOaeBqGgaiMIkbyTYj1FBhkO1yNv9ccClvgFyJHsPZicrLKmR955hWQdnHkyaJKEuCPlRnkyLDOzgREmE5hea8b4iY6iiTRLSXbg1W5kbXqSCmq3fUPzoy4wxMex/h3XSMA6+e8prmYiKUig3uyXwpyus13IU5bw2Oww2Se6zitq1ms+22xGbbH1wIGJBJOCRqJItf7gebxN3aOsyKVOdVakntvSvpacvWlF+M2bfpo8uo9mW4UbTBHiCN39hehkM69mmVGsDPKU6UIruksiwMFDm1BxbXlcm2SiH/kQ+4te/z/8c5X67pYJaJgWlt+Bs4Seq6mEJBBoiBAGmJ9BYga7uuymB7OgxuSVkInS9j4luc7KYON5LgkcC+X7CgbcPOvRv+yE99VfRaHLUzk/LafV6NMnSEWXP8VVQe7yhzAFbN2bqtB4ySsgyaP/bp3qvqiPfCjFuRXXnl9AV70XK745ObZy2kKsHFE6y2h6MQnzE8ItAaE7zr0gO4okpzrCL4WUWtNigWlO4LQ86ta8Y3qQZkRrTyZ3Rw5B+MVTTwK+YzKGZA5/C2Q77ctT1PNwwa5RkFQM+ut4Q8egl6x/LuFKSvi7j8U8mno53mbFWoGm0dzPABsrqzNG2tbETd2a6/xvIX3ITRzC6lp20c7tfjMw5qDaCJd6Wh7/m8AVFJKsrJ94F8=
X-Forefront-Antispam-Report: CIP:194.138.21.73; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(47076005)(6706004)(110136005)(5660300002)(2906002)(36756003)(36860700001)(4326008)(336012)(70586007)(44832011)(54906003)(16576012)(8936002)(70206006)(8676002)(31686004)(53546011)(956004)(26005)(83380400001)(82310400004)(86362001)(498600001)(31696002)(186003)(2616005)(356005)(82960400001)(40460700003)(81166007)(16526019)(3940600001)(36900700001)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 13:49:58.5809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450dbbe5-f988-4f9d-b9e8-08d9f08a0e5c
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.73];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT022.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3920
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

On 15.02.22 14:34, Patrice CHOTARD wrote:
> Hi Jan
> 
> On 2/15/22 14:00, Jan Kiszka wrote:
>> On 15.02.22 12:56, Patrice CHOTARD wrote:
>>> Hi Jan
>>>
>>> On 2/14/22 16:21, Jan Kiszka wrote:
>>>> On 04.01.22 08:42, Patrice Chotard wrote:
>>>>> When OF_LIVE flag is enabled on a 64 bits platform, there is an
>>>>> issue when dev_read_addr() is called and need to perform an address
>>>>> translation using __of_translate_address().
>>>>>
>>>>> In case of error, __of_translate_address() return's value is OF_BAD_ADDR
>>>>> (wich is defined in include/dm/of.h to ((u64)-1) = 0xffffffffffffffff).
>>>>> The return value of dev_read_addr() is often compared to FDT_ADDR_T_NONE
>>>>> which is defined as (-1U) = 0xffffffff.
>>>>> In this case the comparison is always false.
>>>>>
>>>>> To fix this issue, define FDT_ADDR_T_NONE to (ulong)(-1) in case of
>>>>> AARCH64. Update accordingly related tests.
>>>>>
>>>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>>>>
>>>>> ---
>>>>>
>>>>> Changes in v2:
>>>>>  - define FDT_ADDR_T_NONE as ((ulong)(-1)) and keep OF_BAD_ADDR unchanged
>>>>>
>>>>>  include/fdtdec.h   | 5 ++++-
>>>>>  test/dm/ofnode.c   | 2 +-
>>>>>  test/dm/pci.c      | 4 ++--
>>>>>  test/dm/test-fdt.c | 2 +-
>>>>>  4 files changed, 8 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/include/fdtdec.h b/include/fdtdec.h
>>>>> index 6c7ab887b2..e9e2916d6e 100644
>>>>> --- a/include/fdtdec.h
>>>>> +++ b/include/fdtdec.h
>>>>> @@ -24,16 +24,19 @@
>>>>>  typedef phys_addr_t fdt_addr_t;
>>>>>  typedef phys_size_t fdt_size_t;
>>>>>  
>>>>> -#define FDT_ADDR_T_NONE (-1U)
>>>>>  #define FDT_SIZE_T_NONE (-1U)
>>>>>  
>>>>>  #ifdef CONFIG_PHYS_64BIT
>>>>> +#define FDT_ADDR_T_NONE ((ulong)(-1))
>>>>> +
>>>>>  #define fdt_addr_to_cpu(reg) be64_to_cpu(reg)
>>>>>  #define fdt_size_to_cpu(reg) be64_to_cpu(reg)
>>>>>  #define cpu_to_fdt_addr(reg) cpu_to_be64(reg)
>>>>>  #define cpu_to_fdt_size(reg) cpu_to_be64(reg)
>>>>>  typedef fdt64_t fdt_val_t;
>>>>>  #else
>>>>> +#define FDT_ADDR_T_NONE (-1U)
>>>>> +
>>>>>  #define fdt_addr_to_cpu(reg) be32_to_cpu(reg)
>>>>>  #define fdt_size_to_cpu(reg) be32_to_cpu(reg)
>>>>>  #define cpu_to_fdt_addr(reg) cpu_to_be32(reg)
>>>>> diff --git a/test/dm/ofnode.c b/test/dm/ofnode.c
>>>>> index cea0746bb3..e6c925eba6 100644
>>>>> --- a/test/dm/ofnode.c
>>>>> +++ b/test/dm/ofnode.c
>>>>> @@ -286,7 +286,7 @@ static int dm_test_ofnode_get_reg(struct unit_test_state *uts)
>>>>>  	ut_assert(ofnode_valid(node));
>>>>>  	addr = ofnode_get_addr(node);
>>>>>  	size = ofnode_get_size(node);
>>>>> -	ut_asserteq(FDT_ADDR_T_NONE, addr);
>>>>> +	ut_asserteq_64(FDT_ADDR_T_NONE, addr);
>>>>>  	ut_asserteq(FDT_SIZE_T_NONE, size);
>>>>>  
>>>>>  	node = ofnode_path("/translation-test@8000/noxlatebus@3,300/dev@42");
>>>>> diff --git a/test/dm/pci.c b/test/dm/pci.c
>>>>> index fa2e4a8559..00e4440a9d 100644
>>>>> --- a/test/dm/pci.c
>>>>> +++ b/test/dm/pci.c
>>>>> @@ -331,10 +331,10 @@ static int dm_test_pci_addr_live(struct unit_test_state *uts)
>>>>>  	struct udevice *swap1f, *swap1;
>>>>>  
>>>>>  	ut_assertok(dm_pci_bus_find_bdf(PCI_BDF(0, 0x1f, 0), &swap1f));
>>>>> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1f));
>>>>> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1f));
>>>>>  
>>>>>  	ut_assertok(dm_pci_bus_find_bdf(PCI_BDF(0, 0x1, 0), &swap1));
>>>>> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1));
>>>>> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1));
>>>>>  
>>>>>  	return 0;
>>>>>  }
>>>>> diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
>>>>> index 8866d4d959..e1de066226 100644
>>>>> --- a/test/dm/test-fdt.c
>>>>> +++ b/test/dm/test-fdt.c
>>>>> @@ -768,7 +768,7 @@ static int dm_test_fdt_livetree_writing(struct unit_test_state *uts)
>>>>>  	/* Test setting generic properties */
>>>>>  
>>>>>  	/* Non-existent in DTB */
>>>>> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr(dev));
>>>>> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr(dev));
>>>>>  	/* reg = 0x42, size = 0x100 */
>>>>>  	ut_assertok(ofnode_write_prop(node, "reg", 8,
>>>>>  				      "\x00\x00\x00\x42\x00\x00\x01\x00"));
>>>>
>>>> Since this commit, I'm getting this dev_get_priv warning:
>>>>
>>>> [...]
>>>> U-Boot 2022.01-00766-g9876ae7db6d-dirty (Feb 14 2022 - 16:15:21 +0100)
>>>>
>>>> Model: SIMATIC IOT2050 Basic
>>>> DRAM:  1 GiB
>>>> Core:  94 devices, 28 uclasses, devicetree: separate
>>>> WDT:   Not starting watchdog@40610000
>>>> MMC:   mmc@4fa0000: 0
>>>> Loading Environment from SPIFlash... SF: Detected w25q128 with page size
>>>> 256 Bytes, erase size 64 KiB, total 16 MiB
>>>> drivers/dma/ti/k3-udma.c:1744 __dev_get_priv: null device
>>>> drivers/dma/ti/k3-udma.c:1744 __dev_get_priv: null device
>>>> OK
>>>> In:    serial
>>>> Out:   serial
>>>> Err:   serial
>>>> Net:   No ethernet found.
>>>> Hit any key to stop autoboot:  0
>>>>
>>>> (I've instrumented dev_get_priv to tell me file:line)
>>>>
>>>> Is that a sleeping problem surfaced by the commit or a real regression?
>>>> I can boot, though.
>>>>
>>>> Jan
>>>>
>>>
>>> It should be interesting to understand why uclass_get_device_by_phandle() return tmp = NULL.
>>
>> Yep.
>>
>>> What's the return value of uclass_get_device_by_phandle() ?
>>>
>>
>> -22, EINVAL.
> 
> As EINVAL is one of the more "common" error value, i think you have to go deeper 
> to see where the uclass_get_device_by_phandle() is failing.
> 

Sigh, I was hoping to get around debugging this myself.

In any case: With this patch revert, the related code path is still
taken, just successfully:

ti-udma dma-controller@285c0000: ret=0 tmp=00000000bdf10750

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
