Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 659E0259B1
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 23:10:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CC01C87EDA
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 21:10:12 +0000 (UTC)
Received: from avon.wwwdotorg.org (avon.wwwdotorg.org [104.237.132.123])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFC67C54B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 21:10:09 +0000 (UTC)
Received: from [10.20.204.51] (unknown [216.228.112.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by avon.wwwdotorg.org (Postfix) with ESMTPSA id 032A21C0192;
 Tue, 21 May 2019 15:10:07 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
To: Patrick DELAUNAY <patrick.delaunay@st.com>
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
 <1558357207-7345-5-git-send-email-patrick.delaunay@st.com>
 <ac06f0cd-27cf-5878-f8f6-b2bcc5570e05@wwwdotorg.org>
 <175631bffa4b40f38234fd328dcdc1a4@SFHDAG6NODE3.st.com>
From: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <c14b1e7c-169a-cab2-0bc4-886899ea879e@wwwdotorg.org>
Date: Tue, 21 May 2019 15:10:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <175631bffa4b40f38234fd328dcdc1a4@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Stephen Warren <swarren@nvidia.com>, Igor Opaniuk <igor.opaniuk@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 4/8] test: py: add option to
 select device tree used during compilation
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

On 5/21/19 12:32 PM, Patrick DELAUNAY wrote:
> Hi Stephen,
> 
> For information after the remarksSimon's  remark,
> I simplify the test, so this part is no more needed
> See http://patchwork.ozlabs.org/patch/1102938/
> 
> But I will answer with my status and my tests done on the python code.
> 
>>
>> On 5/20/19 7:00 AM, Patrick Delaunay wrote:
>>> Only used for spl compilation which include the device tree (with
>>> platdata or embedded device tree).
>>> For U-boot, test use config.dtb, by default :
>>>      "build_dir + '/arch/sandbox/dts/test.dtb'"
>>>
>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>>> ---
>>> I need to force o_dt = 'all' to avoid make error:
>>>
>>> make: *** empty string invalid as file name.  Stop.
>>>
>>> But, I don't sure that it is the better solution for pytest.
>>
>> This feels a bit odd. What board are you compiling for? I would expect the same
>> compilation commands to "just work" for all boards, and would initially claim that if
>> they don't, it's a bug in the makefiles that should be fixed there.
> 
> Yes, it is strange.
> 
> When I compile the board I have not the problem, I have issue only when I use pytest.
...
> But if I use =
...
>          if device_tree:
>              o_dt = 'DEVICE_TREE=%s' % device_tree
>          else:
>              o_dt = ''
...
> But the second command I have got the next error:
> 
> ./test/py/test.py --bd sandbox --build  -k 'test_000_version'
> +make O=/local/home/frq07632/views/u-boot/u-boot/build-sandbox -s sandbox_defconfig
> +make O=/local/home/frq07632/views/u-boot/u-boot/build-sandbox  -s -j8
> make: *** empty string invalid as file name.  Stop.

Right, o_dt is '' so there's an extra zero-length parameter between the 
"O=" and "-s" argument in that last command, which is what the error 
message complains about.

But this is all with your patch applied. I still don't understand what 
issue this was trying to solve in the first place, i.e. what is/was 
wrong with u-boot.git's master branch. I can run test/py for both 
sandbox and sandbox_spl with unmodified u-boot.git master branch; see 
logs below. Is there still some bug I need to fix, that exists without 
your patch series?

> [swarren@swarren-lx1 u-boot]$ ./test/py/test.py --bd sandbox --build -k test_000_version
> +make O=/home/swarren/shared/git_wa/tegra-uboot-flasher/u-boot/build-sandbox -s sandbox_defconfig
> +make O=/home/swarren/shared/git_wa/tegra-uboot-flasher/u-boot/build-sandbox -s -j8
> ============================= test session starts ==============================
> platform linux2 -- Python 2.7.12, pytest-2.8.7, py-1.4.31, pluggy-0.3.1
> rootdir: /home/swarren/shared/git_wa/tegra-uboot-flasher/u-boot, inifile: 
> collected 503 items 
> 
> test/py/tests/test_000_version.py .
> 
> ================= 502 tests deselected by '-ktest_000_version' =================
> =================== 1 passed, 502 deselected in 0.17 seconds ===================

> [swarren@swarren-lx1 u-boot]$ ./test/py/test.py --bd sandbox_spl --build -k test_000_version
> +make O=/home/swarren/shared/git_wa/tegra-uboot-flasher/u-boot/build-sandbox_spl -s sandbox_spl_defconfig
> +make O=/home/swarren/shared/git_wa/tegra-uboot-flasher/u-boot/build-sandbox_spl -s -j8
> ============================= test session starts ==============================
> platform linux2 -- Python 2.7.12, pytest-2.8.7, py-1.4.31, pluggy-0.3.1
> rootdir: /home/swarren/shared/git_wa/tegra-uboot-flasher/u-boot, inifile: 
> collected 492 items 
> 
> test/py/tests/test_000_version.py .
> 
> ================= 491 tests deselected by '-ktest_000_version' =================
> =================== 1 passed, 491 deselected in 0.31 seconds ===================
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
