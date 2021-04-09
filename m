Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E3135991D
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 11:28:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B04CC56639;
	Fri,  9 Apr 2021 09:28:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97BEDC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 09:28:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1399Ld8L016482; Fri, 9 Apr 2021 11:28:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nDqAsZFDAzLRBAN/69niwoNoTjZ05Z9oQhEmgj1IAxE=;
 b=P0gXdw0NKACf5L62AfKEdHSwtSjeFe7YWNFxwAN1uIYAsOn7PCI+RSycebcS/GUBMJl+
 x8xCR/XcgVjNWppftpODfCnT9V42qJo9wwhhnGW6lc5UVLbv1wDCkqvBI+JJT/LYYy/s
 szTyvczqeSe2ZuhiL7cuJGWejVTMkS2+lOju1ddFY7148jZg6Ko6JDWBu1Ch9C3cQYaJ
 nueRYgh7xUz7+/p1xIUfpenxEk/LzfspnlRlQc6E3U11SoR4fYc0sRiWWyCT3JIYAlNO
 0EsU0DdXYXMFVyRXGNTByudqQa01GTWK5K8W4UnTKmMNzyjfvZP0PJhWe4imfNUIGpO8 aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37sw5yyk44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 11:28:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A82910002A;
 Fri,  9 Apr 2021 11:28:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14B0A226CD9;
 Fri,  9 Apr 2021 11:28:13 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 11:28:12 +0200
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210409073617.16045-1-patrice.chotard@foss.st.com>
 <20210409073617.16045-2-patrice.chotard@foss.st.com>
 <CAHp75Vd+ROF4B7io5QM=SY8S8hfzYe4DJCkM1h9fHkSMWgF30w@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <2d124ca6-664d-08b8-909f-1bde35856529@foss.st.com>
Date: Fri, 9 Apr 2021 11:28:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd+ROF4B7io5QM=SY8S8hfzYe4DJCkM1h9fHkSMWgF30w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] cmd: bind: Fix driver binding on a
	device
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

Hi Andy

On 4/9/21 11:16 AM, Andy Shevchenko wrote:
> On Fri, Apr 9, 2021 at 10:37 AM Patrice Chotard
> <patrice.chotard@foss.st.com> wrote:
>>
>> Fix a regression brings by commit 84f8e36f03fa ("cmd: bind: allow to
>> bind driver with driver data")
>>
>> As example, the following bind command doesn't work:
>>
>>    bind /soc/usb-otg@49000000 usb_ether
>>
>> As usb_ether driver has no compatible string, it can't be find by
>> lists_bind_fdt(). In bind_by_node_path(), which called lists_bind_fdt(),
>> the driver entry is known, pass it to lists_bind_fdt() to force the driver
>> entry selection.
>>
>> For this, add a new parameter struct *driver to lists_bind_fdt().
>> Fix also all lists_bind_fdt() callers.
> 
> With or without comments addressed
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
>>
>> Fixes: 84f8e36f03fa ("cmd: bind: allow to bind driver with driver data")
> 
>>
> 
> No blank line in the tag block.

ok will remove it

> 
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Reported-by: Herbert Poetzl <herbert@13thfloor.at>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Herbert Poetzl <herbert@13thfloor.at>
>> ---
>>
>>  cmd/bind.c                     |  2 +-
>>  drivers/core/device.c          |  2 +-
>>  drivers/core/lists.c           | 11 ++++++++---
>>  drivers/core/root.c            |  2 +-
>>  drivers/misc/imx8/scu.c        |  2 +-
>>  drivers/serial/serial-uclass.c |  2 +-
>>  drivers/timer/timer-uclass.c   |  2 +-
>>  include/dm/lists.h             |  3 ++-
>>  test/dm/nop.c                  |  2 +-
>>  test/dm/test-fdt.c             |  2 +-
>>  10 files changed, 18 insertions(+), 12 deletions(-)
>>
>> diff --git a/cmd/bind.c b/cmd/bind.c
>> index af2f22cc4c..d8f610943c 100644
>> --- a/cmd/bind.c
>> +++ b/cmd/bind.c
>> @@ -152,7 +152,7 @@ static int bind_by_node_path(const char *path, const char *drv_name)
>>         }
>>
>>         ofnode = ofnode_path(path);
>> -       ret = lists_bind_fdt(parent, ofnode, &dev, false);
>> +       ret = lists_bind_fdt(parent, ofnode, &dev, drv, false);
>>
>>         if (!dev || ret) {
>>                 printf("Unable to bind. err:%d\n", ret);
>> diff --git a/drivers/core/device.c b/drivers/core/device.c
>> index 81f6880eac..3abd89aca6 100644
>> --- a/drivers/core/device.c
>> +++ b/drivers/core/device.c
>> @@ -1133,6 +1133,6 @@ int dev_enable_by_path(const char *path)
>>         if (ret)
>>                 return ret;
>>
>> -       return lists_bind_fdt(parent, node, NULL, false);
>> +       return lists_bind_fdt(parent, node, NULL, NULL, false);
>>  }
>>  #endif
>> diff --git a/drivers/core/lists.c b/drivers/core/lists.c
>> index e214306b90..2eb808ce2d 100644
>> --- a/drivers/core/lists.c
>> +++ b/drivers/core/lists.c
>> @@ -182,7 +182,7 @@ static int driver_check_compatible(const struct udevice_id *of_match,
>>  }
>>
>>  int lists_bind_fdt(struct udevice *parent, ofnode node, struct udevice **devp,
>> -                  bool pre_reloc_only)
>> +                  struct driver *drv, bool pre_reloc_only)
>>  {
>>         struct driver *driver = ll_entry_start(struct driver, driver);
>>         const int n_ents = ll_entry_count(struct driver, driver);
>> @@ -225,8 +225,13 @@ int lists_bind_fdt(struct udevice *parent, ofnode node, struct udevice **devp,
>>                 for (entry = driver; entry != driver + n_ents; entry++) {
>>                         ret = driver_check_compatible(entry->of_match, &id,
>>                                                       compat);
>> -                       if (!ret)
>> -                               break;
>> +                       if (drv) {
>> +                               if (drv == entry)
>> +                                       break;
> 
>> +                       } else {
>> +                               if (!ret)
>> +                                       break;
>> +                       }
> 
> This can be simplified to
> } else if (!ret)
>   break;

I know but checkpatch.pl requested it ;-)

Thanks
Patrice

> 
>>                 }
>>                 if (entry == driver + n_ents)
>>                         continue;
>> diff --git a/drivers/core/root.c b/drivers/core/root.c
>> index 9bc682cffe..3c6fa3838d 100644
>> --- a/drivers/core/root.c
>> +++ b/drivers/core/root.c
>> @@ -236,7 +236,7 @@ static int dm_scan_fdt_node(struct udevice *parent, ofnode parent_node,
>>                         pr_debug("   - ignoring disabled device\n");
>>                         continue;
>>                 }
>> -               err = lists_bind_fdt(parent, node, NULL, pre_reloc_only);
>> +               err = lists_bind_fdt(parent, node, NULL, NULL, pre_reloc_only);
>>                 if (err && !ret) {
>>                         ret = err;
>>                         debug("%s: ret=%d\n", node_name, ret);
>> diff --git a/drivers/misc/imx8/scu.c b/drivers/misc/imx8/scu.c
>> index 035a600f71..4ab5cb4bf1 100644
>> --- a/drivers/misc/imx8/scu.c
>> +++ b/drivers/misc/imx8/scu.c
>> @@ -219,7 +219,7 @@ static int imx8_scu_bind(struct udevice *dev)
>>
>>         debug("%s(dev=%p)\n", __func__, dev);
>>         ofnode_for_each_subnode(node, dev_ofnode(dev)) {
>> -               ret = lists_bind_fdt(dev, node, &child, true);
>> +               ret = lists_bind_fdt(dev, node, &child, NULL, true);
>>                 if (ret)
>>                         return ret;
>>                 debug("bind child dev %s\n", child->name);
>> diff --git a/drivers/serial/serial-uclass.c b/drivers/serial/serial-uclass.c
>> index 8a87eed683..6d1c671efc 100644
>> --- a/drivers/serial/serial-uclass.c
>> +++ b/drivers/serial/serial-uclass.c
>> @@ -67,7 +67,7 @@ static int serial_check_stdout(const void *blob, struct udevice **devp)
>>          * anyway.
>>          */
>>         if (node > 0 && !lists_bind_fdt(gd->dm_root, offset_to_ofnode(node),
>> -                                       devp, false)) {
>> +                                       devp, NULL, false)) {
>>                 if (!device_probe(*devp))
>>                         return 0;
>>         }
>> diff --git a/drivers/timer/timer-uclass.c b/drivers/timer/timer-uclass.c
>> index 6f00a5d0db..b1ac604b5b 100644
>> --- a/drivers/timer/timer-uclass.c
>> +++ b/drivers/timer/timer-uclass.c
>> @@ -148,7 +148,7 @@ int notrace dm_timer_init(void)
>>                  * If the timer is not marked to be bound before
>>                  * relocation, bind it anyway.
>>                  */
>> -               if (!lists_bind_fdt(dm_root(), node, &dev, false)) {
>> +               if (!lists_bind_fdt(dm_root(), node, &dev, NULL, false)) {
>>                         ret = device_probe(dev);
>>                         if (ret)
>>                                 return ret;
>> diff --git a/include/dm/lists.h b/include/dm/lists.h
>> index 1a86552546..5896ae3658 100644
>> --- a/include/dm/lists.h
>> +++ b/include/dm/lists.h
>> @@ -53,13 +53,14 @@ int lists_bind_drivers(struct udevice *parent, bool pre_reloc_only);
>>   * @parent: parent device (root)
>>   * @node: device tree node to bind
>>   * @devp: if non-NULL, returns a pointer to the bound device
>> + * @drv: if non-NULL, force this driver to be bound
>>   * @pre_reloc_only: If true, bind only nodes with special devicetree properties,
>>   * or drivers with the DM_FLAG_PRE_RELOC flag. If false bind all drivers.
>>   * @return 0 if device was bound, -EINVAL if the device tree is invalid,
>>   * other -ve value on error
>>   */
>>  int lists_bind_fdt(struct udevice *parent, ofnode node, struct udevice **devp,
>> -                  bool pre_reloc_only);
>> +                  struct driver *drv, bool pre_reloc_only);
>>
>>  /**
>>   * device_bind_driver() - bind a device to a driver
>> diff --git a/test/dm/nop.c b/test/dm/nop.c
>> index 2cd92c5240..75b9e7b6cc 100644
>> --- a/test/dm/nop.c
>> +++ b/test/dm/nop.c
>> @@ -25,7 +25,7 @@ static int noptest_bind(struct udevice *parent)
>>                 const char *bind_flag = ofnode_read_string(ofnode, "bind");
>>
>>                 if (bind_flag && (strcmp(bind_flag, "True") == 0))
>> -                       lists_bind_fdt(parent, ofnode, &dev, false);
>> +                       lists_bind_fdt(parent, ofnode, &dev, NULL, false);
>>                 ofnode = dev_read_next_subnode(ofnode);
>>         }
>>
>> diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
>> index 6e83aeecd9..c6968b0d5f 100644
>> --- a/test/dm/test-fdt.c
>> +++ b/test/dm/test-fdt.c
>> @@ -592,7 +592,7 @@ static int zero_size_cells_bus_child_bind(struct udevice *dev)
>>         int err;
>>
>>         ofnode_for_each_subnode(child, dev_ofnode(dev)) {
>> -               err = lists_bind_fdt(dev, child, NULL, false);
>> +               err = lists_bind_fdt(dev, child, NULL, NULL, false);
>>                 if (err) {
>>                         dev_err(dev, "%s: lists_bind_fdt, err=%d\n",
>>                                 __func__, err);
>> --
>> 2.17.1
>>
> 
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
