Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0807831B5
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 22:06:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8426BC6A5EF;
	Mon, 21 Aug 2023 20:06:56 +0000 (UTC)
Received: from zulu616.server4you.de (mail.csgraf.de [85.25.223.15])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 071B7C65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 20:06:55 +0000 (UTC)
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 94F4160807C7;
 Mon, 21 Aug 2023 22:06:53 +0200 (CEST)
Message-ID: <c7579b16-e373-46ae-87d9-d2a1184d6b8d@csgraf.de>
Date: Mon, 21 Aug 2023 22:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Simon Glass <sjg@chromium.org>, Alper Nebi Yasak <alpernebiyasak@gmail.com>
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-12-alpernebiyasak@gmail.com>
 <CAPnjgZ0Ho7h5T-7S1Mi23+1ez7hq2MCEEZJjjieM3oZNHY5uOQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAPnjgZ0Ho7h5T-7S1Mi23+1ez7hq2MCEEZJjjieM3oZNHY5uOQ@mail.gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v5 11/13] video: Use VIDEO_DAMAGE for
	VIDEO_COPY
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


On 21.08.23 21:11, Simon Glass wrote:
> Hi Alper,
>
> On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>> From: Alexander Graf <agraf@csgraf.de>
>>
>> CONFIG_VIDEO_COPY implemented a range-based copying mechanism: If we
>> print a single character, it will always copy the full range of bytes
>> from the top left corner of the character to the lower right onto the
>> uncached frame buffer. This includes pretty much the full line contents
>> of the printed character.
>>
>> Since we now have proper damage tracking, let's make use of that to reduce
>> the amount of data we need to copy. With this patch applied, we will only
>> copy the tiny rectangle surrounding characters when we print them,
>> speeding up the video console.
> I suppose for rotated consoles it copies whole lines, but otherwise it
> does a lot of small copies?


I tried to keep the code as simple as possible and only track an "upper 
left" and "lower right" corner of modifications. So sync will always 
copy/flush a single rectangle.


>
>> After this, changes to the main frame buffer are not immediately copied
>> to the copy frame buffer, but postponed until the next video device
>> sync. So issue an explicit sync before inspecting the copy frame buffer
>> contents for the video tests.
> So how does the sync get done in this case?


It gets called as part of video_sync():

+static void video_flush_copy(struct udevice *vid)
+{
+	struct video_priv *priv = dev_get_uclass_priv(vid);
+
+	if (!priv->copy_fb)
+		return;
+
+	if (priv->damage.xend && priv->damage.yend) {
+		int lstart = priv->damage.xstart * VNBYTES(priv->bpix);
+		int lend = priv->damage.xend * VNBYTES(priv->bpix);
+		int y;
+
+		for (y = priv->damage.ystart; y < priv->damage.yend; y++) {
+			ulong offset = (y * priv->line_length) + lstart;
+			ulong len = lend - lstart;
+
+			memcpy(priv->copy_fb + offset, priv->fb + offset, len);
+		}
+	}
+}


>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> [Alper: Rebase for fontdata->height/w, fill_part(), fix memmove(dev),
>>          drop from defconfig, use damage.xstart/yend, use IS_ENABLED(),
>>          call video_sync() before copy_fb check, update video_copy test]
>> Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>> ---
>>
>> Changes in v5:
>> - Remove video_sync_copy() also from video_fill(), video_fill_part()
>> - Fix memmove() calls by removing the extra dev argument
>> - Call video_sync() before checking copy_fb in video tests
>> - Use xstart, ystart, xend, yend as names for damage region
>> - Use met->baseline instead of priv->baseline
>> - Use fontdata->height/width instead of VIDEO_FONT_HEIGHT/WIDTH
>> - Use xstart, ystart, xend, yend as names for damage region
>> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
>> - Drop VIDEO_DAMAGE from sandbox defconfig added in a new patch
>> - Update dm_test_video_copy test added in a new patch
>>
>> Changes in v3:
>> - Make VIDEO_COPY always select VIDEO_DAMAGE
>>
>> Changes in v2:
>> - Add patch "video: Use VIDEO_DAMAGE for VIDEO_COPY"
>>
>>   configs/sandbox_defconfig         |  1 -
>>   drivers/video/Kconfig             |  5 ++
>>   drivers/video/console_normal.c    | 13 +----
>>   drivers/video/console_rotate.c    | 44 +++-----------
>>   drivers/video/console_truetype.c  | 16 +----
>>   drivers/video/vidconsole-uclass.c | 16 -----
>>   drivers/video/video-uclass.c      | 97 ++++++++-----------------------
>>   drivers/video/video_bmp.c         |  7 ---
>>   include/video.h                   | 37 ------------
>>   include/video_console.h           | 52 -----------------
>>   test/dm/video.c                   |  3 +-
>>   11 files changed, 43 insertions(+), 248 deletions(-)
>>
>> diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
>> index 51b820f13121..259f31f26cee 100644
>> --- a/configs/sandbox_defconfig
>> +++ b/configs/sandbox_defconfig
>> @@ -307,7 +307,6 @@ CONFIG_USB_ETH_CDC=y
>>   CONFIG_VIDEO=y
>>   CONFIG_VIDEO_FONT_SUN12X22=y
>>   CONFIG_VIDEO_COPY=y
>> -CONFIG_VIDEO_DAMAGE=y
>>   CONFIG_CONSOLE_ROTATION=y
>>   CONFIG_CONSOLE_TRUETYPE=y
>>   CONFIG_CONSOLE_TRUETYPE_CANTORAONE=y
>> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
>> index 97f494a1340b..b3fbd9d7d9ca 100644
>> --- a/drivers/video/Kconfig
>> +++ b/drivers/video/Kconfig
>> @@ -83,11 +83,14 @@ config VIDEO_PCI_DEFAULT_FB_SIZE
>>
>>   config VIDEO_COPY
>>          bool "Enable copying the frame buffer to a hardware copy"
>> +       select VIDEO_DAMAGE
>>          help
>>            On some machines (e.g. x86), reading from the frame buffer is very
>>            slow because it is uncached. To improve performance, this feature
>>            allows the frame buffer to be kept in cached memory (allocated by
>>            U-Boot) and then copied to the hardware frame-buffer as needed.
>> +         It uses the VIDEO_DAMAGE feature to keep track of regions to copy
>> +         and will only copy actually touched regions.
>>
>>            To use this, your video driver must set @copy_base in
>>            struct video_uc_plat.
>> @@ -105,6 +108,8 @@ config VIDEO_DAMAGE
>>            regions of the frame buffer that were modified before, speeding up
>>            screen refreshes significantly.
>>
>> +         It is also used by VIDEO_COPY to identify which regions changed.
>> +
>>   config BACKLIGHT_PWM
>>          bool "Generic PWM based Backlight Driver"
>>          depends on BACKLIGHT && DM_PWM
>> diff --git a/drivers/video/console_normal.c b/drivers/video/console_normal.c
>> index a19ce6a2bc11..c44aa09473a3 100644
>> --- a/drivers/video/console_normal.c
>> +++ b/drivers/video/console_normal.c
>> @@ -35,10 +35,6 @@ static int console_set_row(struct udevice *dev, uint row, int clr)
>>                  fill_pixel_and_goto_next(&dst, clr, pbytes, pbytes);
>>          end = dst;
>>
>> -       ret = vidconsole_sync_copy(dev, line, end);
>> -       if (ret)
>> -               return ret;
>> -
>>          video_damage(dev->parent,
>>                       0,
>>                       fontdata->height * row,
>> @@ -57,14 +53,11 @@ static int console_move_rows(struct udevice *dev, uint rowdst,
>>          void *dst;
>>          void *src;
>>          int size;
>> -       int ret;
>>
>>          dst = vid_priv->fb + rowdst * fontdata->height * vid_priv->line_length;
>>          src = vid_priv->fb + rowsrc * fontdata->height * vid_priv->line_length;
>>          size = fontdata->height * vid_priv->line_length * count;
>> -       ret = vidconsole_memmove(dev, dst, src, size);
>> -       if (ret)
>> -               return ret;
>> +       memmove(dst, src, size);
> Why are you making that change?


There is no point in keeping a special vidconsole_memmove() around 
anymore, since we don't actually need to call vidconsole_sync_copy() 
after the move. The damage call that we introduced to all call sites in 
combination with a video_sync() call takes over the job of the sync copy.


Alex


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
